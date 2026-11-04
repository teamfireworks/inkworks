local ink = require("../../packages/roblox/ink")

export type TextVariant = "caption" | "body" | "label" | "heading" | "title"

export type Token = { color: Color3, transparency: number }

export type Colors = {
	bg: Color3,
	surface: Color3,
	surface_raised: Color3,
	overlay: Color3,
	emphasis: Color3,
	on_surface: Color3,
	muted: Color3,
	accent: Color3,
	on_accent: Color3,
	danger: Color3,
	success: Color3,
	warning: Color3,
	border: Token,
	border_emphasis: Token,
	hover: Token,
	press: Token,
	scrim: Token,
	shadow: Token,
}

export type Theme = {
	colors: Colors,

	shade: { light: number, dark: number },

	text: { [TextVariant]: ink.TextStyle },

	space: { xxs: number, xs: number, sm: number, md: number, lg: number, xl: number, xxl: number },
	radius: { sm: number, md: number, lg: number, full: number },

	motion: { speed: number, damping: number },
}

return nil
