local ink = require("../../packages/roblox/ink")
local prospero = require("../../packages/roblox/prospero")

const function icon(bounds: Rect, key: prospero.Icon, weight: prospero.Weight)
	const asset_id, offset = prospero.get(key, weight)
	return ink.image(bounds, asset_id, { rect_offset = offset, rect_size = prospero.ICON_SIZE })
end

return icon
