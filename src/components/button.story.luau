local ink = require("../../packages/roblox/ink")
local ui_labs = require("../../packages/roblox/ui_labs")
local theme_context = require("../theme/theme_context")
local theme_presets = require("../theme/theme_presets")
local button = require("./button")

const CONTROLS = {
	label = "Press Me",
	disabled = false,
	variant = ui_labs.Choose<<button.ButtonVariant>>({ "default", "accent", "ghost", "danger", "success" }),
}

return ink.ui_labs_story({
	controls = CONTROLS,
	render = function(properties: ink.StoryProperties<typeof(CONTROLS)>)
		const s = properties.scope:key("button")
		const theme = theme_context:provide(s, theme_presets.STUDIO_LIGHT)

		return ink.compose({
			ink.solid(properties.target_bounds, theme.colors.bg),
			ink.align(
				button(s, {
					label = "Press Me",
					disabled = properties.controls.disabled,
					variant = properties.controls.variant,
					activated = function() end,
				}),
				properties.target_bounds,
				ink.ALIGN_MID,
				ink.ALIGN_MID
			),
		})
	end,
})
