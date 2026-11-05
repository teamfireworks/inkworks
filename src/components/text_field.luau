local ink = require("../../packages/roblox/ink")
local theme = require("../theme")

type Error = string

export type TextFieldProperties = {
	width: number,
	placeholder: string,
	value: string?,
	validate: ((string) -> Error?)?,
}

const function text_field(s: ink.Scope, p: TextFieldProperties): (ink.Composite, ink.TextField)
	const t = theme.context:get(s)
	const style = t.text.label
	const pad = t.space.lg

	const box = ink.rect_sized(p.width, style.size + pad * 2)
	const inner = ink.inset_rect(box, pad)

	local field = ink.text_field(s:key("field"), inner, p.value or "", style)

	local stroke_color = t.colors.accent
	local validation_error: string?

	if p.validate then
		validation_error = p.validate(field.value)
		if validation_error then
			stroke_color = t.colors.danger
		end
	end

	local styled = ink.tint(field, t.colors.on_surface)
	styled = ink.clip(styled, inner)

	local bg = ink.solid(box)
	bg = ink.tint(bg, t.colors.surface)
	bg = ink.round(bg, t.radius.lg)

	stroke_color = ink.spring(s:key("stroke_color"), stroke_color, 30, 1)
	local stroke_thickness = ink.spring(s:key("stroke_thickness"), field.focused and t.space.xs or t.space.lg, 15, 1)
	local stroke_transparency = ink.spring(s:key("stroke_transparency"), field.focused and 0 or 1, 30, 1)
	bg = ink.stroke(bg, { color = stroke_color, thickness = stroke_thickness, transparency = stroke_transparency })

	local placeholder = ink.tint(ink.text(p.placeholder, style))
	local placeholder_visibility = ink.spring(s:key("placeholder_visibility"), field.value == "" and 0 or 1, 30, 1)
	placeholder = ink.align(placeholder, inner, ink.ALIGN_START, ink.ALIGN_MID)
	placeholder = ink.tint(placeholder, t.colors.muted, placeholder_visibility)
	placeholder = ink.translate(placeholder, placeholder_visibility * t.space.md, 0)

	local c = ink.compose({ bg, placeholder, styled })

	if validation_error then
		local error_message = ink.text(validation_error, t.text.label)
		error_message = ink.tint(error_message, t.colors.danger)
		c = ink.v_stack({ c, error_message }, t.space.sm)
	end

	return c, field
end

return text_field
