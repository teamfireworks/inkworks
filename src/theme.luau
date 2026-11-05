local ink = require("../packages/roblox/ink")

export type TextVariant = "caption" | "body" | "label" | "heading" | "title"

export type ColorToken = { color: Color3, transparency: number }
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
	border: ColorToken,
	border_emphasis: ColorToken,
	hover: ColorToken,
	press: ColorToken,
	scrim: ColorToken,
	shadow: ColorToken,
}

export type Theme = {
	colors: Colors,

	shade: { hover: number, press: number },

	text: { [TextVariant]: ink.TextStyle },

	space: { xxs: number, xs: number, sm: number, md: number, lg: number, xl: number, xxl: number },
	radius: { sm: number, md: number, lg: number, full: number },

	motion: { speed: number, damping: number },
}

const function color_token(r: number, g: number, b: number, transparency: number): ColorToken
	return { color = Color3.fromRGB(r, g, b), transparency = transparency }
end

const theme = {}

theme.DEFAULT_TEXT = table.freeze({
	caption = table.freeze({ size = 13, font = Enum.Font.BuilderSans }),
	body = table.freeze({ size = 15, font = Enum.Font.BuilderSans }),
	label = table.freeze({ size = 15, font = Enum.Font.BuilderSansMedium }),
	heading = table.freeze({ size = 18, font = Enum.Font.BuilderSansBold }),
	title = table.freeze({ size = 25, font = Enum.Font.BuilderSansBold }),
})

theme.DEFAULT_SPACE = table.freeze({ xxs = 1, xs = 2, sm = 4, md = 6, lg = 8, xl = 10, xxl = 12 })
theme.DEFAULT_RADIUS = table.freeze({ sm = 4, md = 6, lg = 8, full = math.huge })
theme.DEFAULT_MOTION = table.freeze({ speed = 30, damping = 1 })

theme.STUDIO_DARK = table.freeze({
	colors = table.freeze({
		bg = Color3.fromRGB(18, 18, 21),
		surface = Color3.fromRGB(32, 34, 39),
		surface_raised = Color3.fromRGB(51, 52, 58),
		overlay = Color3.fromRGB(39, 41, 48),
		emphasis = Color3.fromRGB(247, 247, 248),
		on_surface = Color3.fromRGB(213, 215, 221),
		muted = Color3.fromRGB(188, 190, 200),
		accent = Color3.fromRGB(51, 95, 255),
		on_accent = Color3.fromRGB(247, 247, 248),
		danger = Color3.fromRGB(223, 40, 31),
		success = Color3.fromRGB(57, 197, 130),
		warning = Color3.fromRGB(242, 186, 42),
		border = color_token(208, 217, 251, 0.88),
		border_emphasis = color_token(208, 217, 251, 0.84),
		hover = color_token(208, 217, 251, 0.92),
		press = color_token(208, 217, 251, 0.88),
		scrim = color_token(10, 10, 14, 0.25),
		shadow = color_token(0, 0, 0, 0.5),
	}),
	shade = table.freeze({
		hover = 0.015,
		press = -0.0075,
	}),
	text = theme.DEFAULT_TEXT,
	space = theme.DEFAULT_SPACE,
	radius = theme.DEFAULT_RADIUS,
	motion = theme.DEFAULT_MOTION,
}) :: Theme

theme.STUDIO_LIGHT = table.freeze({
	colors = table.freeze({
		bg = Color3.fromRGB(255, 255, 255),
		surface = Color3.fromRGB(247, 247, 248),
		surface_raised = Color3.fromRGB(255, 255, 255),
		overlay = Color3.fromRGB(247, 247, 248),
		emphasis = Color3.fromRGB(32, 34, 39),
		on_surface = Color3.fromRGB(73, 77, 90),
		muted = Color3.fromRGB(106, 111, 129),
		accent = Color3.fromRGB(51, 95, 255),
		on_accent = Color3.fromRGB(247, 247, 248),
		danger = Color3.fromRGB(223, 40, 31),
		success = Color3.fromRGB(57, 197, 130),
		warning = Color3.fromRGB(242, 186, 42),
		border = color_token(27, 37, 75, 0.88),
		border_emphasis = color_token(27, 37, 75, 0.84),
		hover = color_token(27, 37, 75, 0.92),
		press = color_token(27, 37, 75, 0.88),
		scrim = color_token(10, 10, 14, 0.5),
		shadow = color_token(0, 0, 0, 0.5),
	}),
	shade = table.freeze({
		hover = -0.03,
		press = -0.06,
	}),
	text = theme.DEFAULT_TEXT,
	space = theme.DEFAULT_SPACE,
	radius = theme.DEFAULT_RADIUS,
	motion = theme.DEFAULT_MOTION,
}) :: Theme

theme.context = ink.context<<Theme>>(theme.STUDIO_DARK)

return table.freeze(theme)
