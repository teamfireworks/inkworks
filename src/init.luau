local button = require("@self/components/button")
local text = require("@self/components/text")
local text_field = require("@self/components/text_field")

export type ButtonVariant = button.ButtonVariant
export type ButtonSize = button.ButtonSize
export type ButtonProperties = button.ButtonProperties

export type TextFieldProperties = text_field.TextFieldProperties

--- @class inkworks
--- Roblox UI swiss-knife component library.
const inkworks = {}
inkworks.button = button
inkworks.text = text
inkworks.text_field = text_field

return table.freeze(inkworks)
