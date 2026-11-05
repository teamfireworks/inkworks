local ink = require("../../packages/roblox/ink")
local ui_labs = require("../../packages/roblox/ui_labs")
local theme = require("../theme")
local text = require("./text")
local theme_preview = require("./theme_preview")

const CONTROLS = {
	text = "Hello Ink!",
	variant = ui_labs.Choose<<theme.TextVariant>>({ "body", "caption", "heading", "label", "title" }),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		return theme_preview(properties.scope, properties.target_bounds, function(s)
			const t = theme.context:get(s)
			return ink.tint(text(s, properties.controls.text, properties.controls.variant), t.colors.on_surface)
		end)
	end,
})
