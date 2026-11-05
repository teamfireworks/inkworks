local ink = require("../../packages/roblox/ink")
local phosphor = require("../../packages/roblox/phosphor")

const function icon(bounds: Rect, key: phosphor.Key, weight: phosphor.Weight)
	const asset_id, offset = phosphor.locate(key, weight)
	return ink.image(bounds, asset_id, { rect_offset = offset, rect_size = phosphor.ICON_SIZE })
end

return icon
