let fileRegex = /src\/Stories\/(.*)\.elm$/
let compiler = require('node-elm-compiler')
let chokidar = require('chokidar')
let fs = require('fs')

const Tracker = (() => {
  // Maps a dependency's filepath to an object containing keys of story filepaths depending on it
  // 
  // For example:
  // If module "A" imports "B" and "C", and module "D" also imports "C" this will be: 
  // files == { "B": { "A": true }, "C": { "A": true, "D": true } }
  // 
  // This makes it easy to say "Hey, looks like "C" changed– who's depending on that module?"
  // 
  let files = {}

  // Anytime a dependency changes, this should run "touch" on any dependent stories
  let watcher = chokidar.watch([], { ignoreInitial: true })
    .on('all', (_event, pathOfWatchedDependency) => {
      let filepathsNeedingThisDep = Object.keys(files[pathOfWatchedDependency] || {})
      filepathsNeedingThisDep.forEach(touchFile)
    })
  let touchFile = filepath => fs.utimes(filepath, Date.now(), Date.now(), () => { })


  let track = async (filepath) =>
    compiler.findAllDependencies(filepath)
      .then(addToFiles(filepath))

  let addToFiles = (filepath) => (newDependencies) => {
    newDependencies.forEach(depFilepath => {
      files[depFilepath] = files[depFilepath] || {}
      files[depFilepath][filepath] = true
    })

    watcher.add(newDependencies)
  }

  return {
    track
  }
})()

module.exports = () => ({
  name: 'storybook-elm',
  enforce: 'pre',
  transform: async (rawSource, id) => {
    if (fileRegex.test(id)) {
      let modulePath = fileRegex.exec(id)[1]
      let finalModuleName = modulePath.split('/').slice(-1)[0]
      let fullModuleName = modulePath.split('/').join('.')

      let compiledJs

      // Attempt to compile the story, without the extra console logging stuff 
      let log = console.log
      try {
        console.log = () => { }
        compiledJs = await compiler.compileToString(id, { optimize: false, debug: false })
        console.log = log
      } catch (elmCompilerError) {
        console.log = log
        throw ('Elm found an error!\n\n' + elmCompilerError.message.slice('Compilation failed\nCompiling ...'.length))
      }

      let transformedCode =
        compiledJs
          .replace('(this)', '(globalThis)')
          .replace(`console.warn('Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.1/optimize for better performance and smaller assets.');`, '')

      Tracker.track(id)

      return {
        code: `
${transformedCode}

export default {
  title: "${modulePath}",
  parameters: {
    elmSource: \`${rawSource.split('`').join('\`')}\`,
    layout: 'centered'
  },
  argTypes: {
    onAction: { action: "Elm", control: 'none' }
  }
}

export const ${finalModuleName} = (controls) => {
  let node = document.createElement('div')
  window.requestAnimationFrame(() => {
    let app = globalThis.Elm.Stories.${fullModuleName}.init({ node })
    if (app.ports && app.ports.logAction) {
      app.ports.logAction.subscribe((msg) => {
        controls.onAction(msg)
      })
    }
  })
  return node
}
`.trim(),
        map: null
      }
    }
  }
})