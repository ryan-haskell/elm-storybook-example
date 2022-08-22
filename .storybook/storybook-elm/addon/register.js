const React = require("react")
const { addons } = require("@storybook/addons")
const { StoryPanel } = require("./StoryPanel.js")

const ADDON_ID = "ryannhg/elm-source"
const PANEL_ID = `${ADDON_ID}/panel`

addons.register(ADDON_ID, (api) => {
  addons.addPanel(PANEL_ID, {
    title: "Source",
    paramKey: "elm-source",
    render: ({ active, key }) => {
      return (active)
        ? React.createElement(StoryPanel, { className: "banana", key, api }, null)
        : null
    },
  })
})