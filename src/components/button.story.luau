local ink = require("../../packages/roblox/ink")
local ui_labs = require("../../packages/roblox/ui_labs")
local button = require("./button")
local theme_preview = require("./theme_preview")

const CONTROLS = {
	label = "Press Me",
	disabled = false,
	size = ui_labs.Choose<<button.ButtonSize>>({ "default", "sm", "lg" }),
	variant = ui_labs.Choose<<button.ButtonVariant>>({ "default", "accent", "ghost", "danger", "success" }),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		const s_count = properties.scope:key("count")
		const count = s_count:get(0)
		const function activated()
			print(`Pressed {s_count:set(count + 1)}x times`)
		end

		return theme_preview(properties.scope, properties.target_bounds, function(s)
			return button(s, {
				label = "Press Me",
				variant = properties.controls.variant,
				size = properties.controls.size,
				disabled = properties.controls.disabled,
				activated = activated,
			})
		end)
	end,
})
