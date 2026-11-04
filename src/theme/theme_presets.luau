-- theme.luau
local theme_types = require("./theme_types")

const function token(r: number, g: number, b: number, transparency: number): theme_types.Token
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

theme.DEFAULT_SPACE = table.freeze({ xxs = 1, xs = 2, sm = 4, md = 8, lg = 12, xl = 16, xxl = 24 })
theme.DEFAULT_RADIUS = table.freeze({ sm = 4, md = 6, lg = 8, full = math.huge })
theme.DEFAULT_MOTION = table.freeze({ speed = 30, damping = 1 })

theme.STUDIO_DARK = table.freeze({
	colors = table.freeze({
		bg = Color3.fromRGB(18, 18, 21),
		surface = Color3.fromRGB(25, 26, 31),
		surface_raised = Color3.fromRGB(32, 34, 39),
		overlay = Color3.fromRGB(39, 41, 48),
		emphasis = Color3.fromRGB(247, 247, 248),
		on_surface = Color3.fromRGB(213, 215, 221),
		muted = Color3.fromRGB(188, 190, 200),
		accent = Color3.fromRGB(51, 95, 255),
		on_accent = Color3.fromRGB(247, 247, 248),
		danger = Color3.fromRGB(223, 40, 31),
		success = Color3.fromRGB(57, 197, 130),
		warning = Color3.fromRGB(242, 186, 42),
		border = token(208, 217, 251, 0.88),
		border_emphasis = token(208, 217, 251, 0.84),
		hover = token(208, 217, 251, 0.92),
		press = token(208, 217, 251, 0.88),
		scrim = token(10, 10, 14, 0.25),
		shadow = token(0, 0, 0, 0.5),
	}),
	shade = table.freeze({
		light = -0.04,
		dark = -0.02,
	}),
	text = theme.DEFAULT_TEXT,
	space = theme.DEFAULT_SPACE,
	radius = theme.DEFAULT_RADIUS,
	motion = theme.DEFAULT_MOTION,
}) :: theme_types.Theme

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
		border = token(27, 37, 75, 0.88),
		border_emphasis = token(27, 37, 75, 0.84),
		hover = token(27, 37, 75, 0.92),
		press = token(27, 37, 75, 0.88),
		scrim = token(10, 10, 14, 0.5),
		shadow = token(0, 0, 0, 0.5),
	}),
	shade = table.freeze({
		light = -0.02,
		dark = -0.04,
	}),
	text = theme.DEFAULT_TEXT,
	space = theme.DEFAULT_SPACE,
	radius = theme.DEFAULT_RADIUS,
	motion = theme.DEFAULT_MOTION,
}) :: theme_types.Theme

return table.freeze(theme)
