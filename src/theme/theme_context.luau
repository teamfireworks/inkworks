local ink = require("../../packages/roblox/ink")
local theme_presets = require("./theme_presets")
local theme_types = require("./theme_types")

const theme_context = ink.context<<theme_types.Theme>>(theme_presets.STUDIO_DARK)

return theme_context
