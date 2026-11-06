local ink = require("../../packages/roblox/ink")
local prospero = require("../../packages/roblox/prospero")
local ui_labs = require("../../packages/roblox/ui_labs")
local icon = require("./icon")
local theme_preview = require("./theme_preview")

const CONTROLS = {
	rgba = ui_labs.RGBA(Color3.new(1, 1, 1), 0),
	size = ui_labs.Slider(64, 8, 256, 8),
	icon = ui_labs.Choose<<any>>(prospero.ICON_NAMES),
	weight = ui_labs.Choose(prospero.ICON_WEIGHTS, table.find(prospero.ICON_WEIGHTS :: { string }, "regular")),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		return theme_preview(properties.scope, properties.target_bounds, function(s): ink.Composite
			return ink.tint(
				icon(
					ink.rect_sized(properties.controls.size, properties.controls.size),
					properties.controls.icon,
					properties.controls.weight
				),
				properties.controls.rgba.Color,
				properties.controls.rgba.Transparency
			)
		end)
	end,
})
