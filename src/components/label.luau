local ink = require("../../packages/roblox/ink")
local theme_context = require("../theme/theme_context")
local theme_types = require("../theme/theme_types")

const function label(s: ink.Scope, content: string, variant: theme_types.TextVariant)
	const theme = theme_context:get(s)
	return ink.text(content, theme.text[variant])
end

return label
