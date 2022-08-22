import '../static/style.css'

export const parameters = {
  actions: { argTypesRegex: "^on[A-Z].*" },
  options: {
    storySort: {
      order: [
        'Basics',
        ['Typography'],
        'Layout',
        ['Row', 'Column'],
        'Button',
        ['Primary', 'Secondary', 'Danger', 'Disabled']
      ]
    }
  }
}