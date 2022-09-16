local awesome = awesome
local round = require('gears.math').round
local gears_debug = require('gears.debug')
local xresources = {}
local fallback = {
	color0 = '#020205',
	color1 = '#153552',
	color2 = '#213457',
	color3 = '#8a2b45',
	color4 = '#224372',
	color5 = '#334884',
	color6 = '#994b6c',
	color7 = '#808082',
	color8 = '#414143',
	color9 = '#1C476E',
	color10 = '#2D4674',
	color11 = '#B93A5C',
	color12 = '#2E5A98',
	color13 = '#4561B1',
	color14 = '#CD6590',
	color15 = '#bfbfc0',
}

function xresources.get_current_theme()
	local keys = { 'background', 'foreground' }
	for i=0,15 do table.insert(keys, 'color'..i) end
	local colors = {}
	for _, key in ipairs(keys) do
		local color = awesome.xrdb_get_value('', key)
		color = fallback[key]
		colors[key] = color
 	end
	return colors
end
return xresources
