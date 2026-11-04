local ink = require("../../packages/roblox/ink")
local theme_context = require("../theme/theme_context")
local theme_types = require("../theme/theme_types")
local label = require("./label")

export type ButtonVariant = "default" | "accent" | "ghost" | "success" | "danger"

export type ButtonProperties = {
	variant: ButtonVariant?,
	disabled: boolean?,
	activated: () -> (),

	bounds: Rect?,
	label: string?,
	content: ink.Composite?,
}

const function button_colors(theme: theme_types.Theme, variant: ButtonVariant): (Color3, Color3)
	if variant == "default" then
		return theme.colors.surface, theme.colors.on_surface
	elseif variant == "accent" then
		return theme.colors.accent, theme.colors.on_accent
	elseif variant == "ghost" then
		return theme.colors.surface, theme.colors.on_surface
	elseif variant == "danger" then
		return theme.colors.danger, theme.colors.on_accent
	elseif variant == "success" then
		return theme.colors.success, theme.colors.on_accent
	else
		error("unreachable")
	end
end

const function button(s: ink.Scope, properties: ButtonProperties): ink.Composite
	local theme = theme_context:get(s)

	local content_composites
	if properties.content then
		content_composites = { properties.content }
	else
		content_composites = {}
		if properties.label then
			table.insert(content_composites, label(s, properties.label, "label"))
		end
	end
	local content = ink.h_stack(content_composites, theme.space.sm)

	local variant = properties.variant or "default"
	local bg_transparency, fg_transparency = 0, 0
	local bg_color, fg_color = button_colors(theme, variant)

	local bounds = properties.bounds or ink.inset_rect(content.bounds, -theme.space.lg)
	local hit = ink.hit_region(s, bounds)

	if properties.disabled then
		bg_transparency, fg_transparency = 0.5, 0.5
	else
		if hit.clicked then
			properties.activated()
		end

		if hit.state == Enum.GuiState.Hover then
			bg_color = ink.color.shade(bg_color, theme.shade.dark)
		elseif hit.state == Enum.GuiState.Press then
			bg_color = ink.color.shade(bg_color, theme.shade.light)
		elseif properties.variant == "ghost" then
			bg_transparency = 1
		end
	end

	bg_transparency = ink.spring(s:key("bg_transparency"), bg_transparency, theme.motion.speed, theme.motion.damping)
	fg_transparency = ink.spring(s:key("fg_transparency"), fg_transparency, theme.motion.speed, theme.motion.damping)
	bg_color = ink.spring(s:key("bg_color"), bg_color, theme.motion.speed, theme.motion.damping)
	fg_color = ink.spring(s:key("fg_color"), fg_color, theme.motion.speed, theme.motion.damping)

	local bg = ink.solid(bounds, Color3.new(1, 1, 1))
	bg = ink.round(bg, theme.radius.lg)
	bg = ink.tint(bg, bg_color, bg_transparency)

	content = ink.tint(content, fg_color, fg_transparency)
	content = ink.align(content, bounds, ink.ALIGN_MID, ink.ALIGN_MID)

	return ink.compose({ bg, content, hit })
end

return button
