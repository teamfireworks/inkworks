local ink = require("../../packages/roblox/ink")
local ui_labs = require("../../packages/roblox/ui_labs")
local text_field = require("./text_field")
local theme_preview = require("./theme_preview")

const CONTROLS = {
	placeholder = "Search components...",
	width = ui_labs.Slider(256, 64, 512, 1),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		return theme_preview(properties.scope, properties.target_bounds, function(s): ink.Composite
			return (
				text_field(s, {
					width = properties.controls.width,
					placeholder = properties.controls.placeholder,
					validate = function(value)
						return if value == "forbidden" then "cannot type forbidden" else nil
					end,
				})
			)
		end)
	end,
})
