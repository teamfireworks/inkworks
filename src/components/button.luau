local ink = require("../../packages/roblox/ink")
local theme = require("../theme")
local label = require("./label")

export type ButtonVariant = "default" | "accent" | "ghost" | "success" | "danger"
export type ButtonSize = "default" | "sm" | "lg"

export type ButtonProperties = {
	variant: ButtonVariant?,
	size: ButtonSize?,
	disabled: boolean?,
	activated: () -> (),
	bounds: Rect?,
	label: string?,
	content: ink.Composite?,
}

const function button_colors(t: theme.Theme, variant: ButtonVariant): (Color3, Color3)
	if variant == "default" then
		return t.colors.surface, t.colors.on_surface
	elseif variant == "accent" then
		return t.colors.accent, t.colors.on_accent
	elseif variant == "ghost" then
		return t.colors.surface, t.colors.on_surface
	elseif variant == "danger" then
		return t.colors.danger, t.colors.on_accent
	elseif variant == "success" then
		return t.colors.success, t.colors.on_accent
	else
		error("unreachable")
	end
end

const function button_space(t: theme.Theme, size: ButtonSize)
	if size == "default" then
		return t.space.sm, t.space.xl, t.space.lg, t.radius.lg
	elseif size == "sm" then
		return t.space.xs, t.space.lg, t.space.md, t.radius.md
	elseif size == "lg" then
		return t.space.md, t.space.xxl, t.space.xl, t.radius.lg
	else
		error("unreachable")
	end
end

const function button(s: ink.Scope, properties: ButtonProperties): ink.Composite
	local t = theme.context:get(s)

	local variant = properties.variant or "default"
	local gap, x_pad, y_pad, round = button_space(t, properties.size or "default")
	local bg_transparency, fg_transparency = 0, 0
	local bg_color, fg_color = button_colors(t, variant)

	local content_composites
	if properties.content then
		content_composites = { properties.content }
	else
		content_composites = {}
		if properties.label then
			table.insert(content_composites, label(s, properties.label, "label"))
		end
	end
	local content = ink.h_stack(content_composites, gap)

	local bounds = properties.bounds or ink.inset_rect_xy(content.bounds, -x_pad, -y_pad)
	local hit = ink.hit_region(s, bounds)

	if properties.disabled then
		bg_transparency, fg_transparency = 0.5, 0.5
	else
		if hit.clicked then
			properties.activated()
		end

		if hit.state == Enum.GuiState.Hover then
			bg_color = ink.color.shade(bg_color, t.shade.hover)
		elseif hit.state == Enum.GuiState.Press then
			bg_color = ink.color.shade(bg_color, t.shade.press)
		elseif properties.variant == "ghost" then
			bg_transparency = 1
		end
	end

	bg_transparency = ink.spring(s:key("bg_transparency"), bg_transparency, t.motion.speed, t.motion.damping)
	fg_transparency = ink.spring(s:key("fg_transparency"), fg_transparency, t.motion.speed, t.motion.damping)
	bg_color = ink.spring(s:key("bg_color"), bg_color, t.motion.speed, t.motion.damping)
	fg_color = ink.spring(s:key("fg_color"), fg_color, t.motion.speed, t.motion.damping)

	local bg = ink.solid(bounds, Color3.new(1, 1, 1))
	bg = ink.round(bg, round)
	bg = ink.tint(bg, bg_color, bg_transparency)

	content = ink.tint(content, fg_color, fg_transparency)
	content = ink.align(content, bounds, ink.ALIGN_MID, ink.ALIGN_MID)

	return ink.compose({ bg, content, hit })
end

return button
