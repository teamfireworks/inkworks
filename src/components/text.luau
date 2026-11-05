local ink = require("../../packages/roblox/ink")
local theme = require("../theme")

const function label(s: ink.Scope, content: string, variant: theme.TextVariant, style: ink.TextStyle?)
	const t = theme.context:get(s)
	return ink.tint(
		ink.text(content, {
			font = style and style.font or t.text[variant].font,
			size = style and style.size or t.text[variant].size,
			max_width = style and style.max_width,
			align_x = style and style.align_x,
		}),
		t.colors.on_surface
	)
end

return label
