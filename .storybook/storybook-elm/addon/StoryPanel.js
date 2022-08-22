const React = require('react')
const { useParameter } = require('@storybook/api')

const { PrismLight } = require('react-syntax-highlighter')
const { oneLight } = require('react-syntax-highlighter/dist/cjs/styles/prism')
const elm = require('react-syntax-highlighter/dist/cjs/languages/prism/elm')
PrismLight.registerLanguage('elm', elm["default"])

const StoryPanel = () => {
  const elmSource = useParameter('elmSource', null)

  return elmSource
    ? React.createElement(PrismLight, {
      language: 'elm',
      style: oneLight,
      customStyle: { margin: 0 },
      showLineNumbers: true
    }, elmSource)
    : null
}

module.exports = {
  StoryPanel
}