local awesome = awesome
local round = require('gears.math').round
local gears_debug = require('gears.debug')
local xresources = {}
local fallback = {
	color0 = '#030302',
	color1 = '#774e24',
	color2 = '#9c421d',
	color3 = '#725539',
	color4 = '#556739',
	color5 = '#967627',
	color6 = '#7a6e43',
	color7 = '#818180',
	color8 = '#424241',
	color9 = '#9F6831',
	color10 = '#D05827',
	color11 = '#99724D',
	color12 = '#728A4D',
	color13 = '#C89E34',
	color14 = '#A3935A',
	color15 = '#c0c0bf',
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
