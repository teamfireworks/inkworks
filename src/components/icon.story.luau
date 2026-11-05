local ink = require("../../packages/roblox/ink")
local phosphor = require("../../packages/roblox/phosphor")
local ui_labs = require("../../packages/roblox/ui_labs")
local icon = require("./icon")
local theme_preview = require("./theme_preview")

const weights = {}
for weight in phosphor.ICON_SETS :: any do
	table.insert(weights, weight)
end
table.sort(weights)

const keys = {}
for key in phosphor.ICON_SETS.regular :: any do
	table.insert(keys, key)
end
table.sort(keys)

const CONTROLS = {
	rgba = ui_labs.RGBA(Color3.new(1, 1, 1), 0),
	size = ui_labs.Slider(64, 8, 256, 8),
	key = ui_labs.Choose(keys),
	weight = ui_labs.Choose(weights, table.find(weights, "regular")),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		return theme_preview(properties.scope, properties.target_bounds, function(s): ink.Composite
			return ink.tint(
				icon(
					ink.rect_sized(properties.controls.size, properties.controls.size),
					properties.controls.key,
					properties.controls.weight
				),
				properties.controls.rgba.Color,
				properties.controls.rgba.Transparency
			)
		end)
	end,
})
