local awesome = awesome
local round = require("gears.math").round
local gears_debug = require("gears.debug")
local xresources = {}
local fallback = {
  color0 = '#040303',
  color1 = '#42362f',
  color2 = '#672311',
  color3 = '#7a200f',
  color4 = '#7a3a15',
  color5 = '#a64514',
  color6 = '#993019',
  color7 = '#818181',
  color8 = '#424242',
  color9 = '#58483F',
  color10 = '#8A2F17',
  color11 = '#A32B15',
  color12 = '#A34E1C',
  color13 = '#DE5D1B',
  color14 = '#CC4022',
  color15 = '#c0c0c0',
}
function xresources.get_current_theme()
  local keys = { 'background', 'foreground' }
  for i=0,15 do table.insert(keys, "color"..i) end
  local colors = {}
  for _, key in ipairs(keys) do
    local color = awesome.xrdb_get_value("", key)
    color = fallback[key]
    colors[key] = color
  end
  return colors
end
return xresources