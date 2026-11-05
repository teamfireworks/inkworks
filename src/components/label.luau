local ink = require("../../packages/roblox/ink")
local theme = require("../theme")

const function label(s: ink.Scope, content: string, variant: theme.TextVariant)
	const t = theme.context:get(s)
	return ink.text(content, t.text[variant])
end

return label
