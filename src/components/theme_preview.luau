local ink = require("../../packages/roblox/ink")
local theme = require("../theme")

const THEMES: { theme.Theme } = { theme.STUDIO_DARK, theme.STUDIO_LIGHT }

const function theme_preview(s: ink.Scope, container: Rect, component: (s: ink.Scope) -> ink.Composite)
	const widths = ink.distribute(container.Width, table.create<<ink.Length>>(#THEMES, { fr = 1 }))

	const cells = table.create<<ink.Composite>>(#THEMES)
	local x = container.Min.X
	for i, t in THEMES do
		const s_themed = s:key(i)
		theme.context:provide(s_themed, t)

		const cell = Rect.new(x, container.Min.Y, x + widths[i], container.Max.Y)
		x += widths[i]

		cells[i] = ink.compose({
			ink.solid(cell, t.colors.bg),
			ink.align(component(s_themed), cell, ink.ALIGN_MID, ink.ALIGN_MID),
		})
	end

	return ink.compose(cells)
end

return theme_preview
