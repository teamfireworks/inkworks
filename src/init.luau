local button = require("@self/components/button")

export type ButtonVariant = button.ButtonVariant
export type ButtonProperties = button.ButtonProperties

const inkworks = {}
inkworks.button = button

return table.freeze(inkworks)
