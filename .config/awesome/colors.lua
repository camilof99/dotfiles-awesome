local awesome = awesome
local round = require("gears.math").round
local gears_debug = require("gears.debug")
local xresources = {}
local fallback = {
  color0 = '#030304',
  color1 = '#2a343c',
  color2 = '#2c3b4c',
  color3 = '#3a454e',
  color4 = '#6f282e',
  color5 = '#2a3e63',
  color6 = '#4a5965',
  color7 = '#818181',
  color8 = '#424242',
  color9 = '#394651',
  color10 = '#3B4F66',
  color11 = '#4E5C68',
  color12 = '#95363E',
  color13 = '#395385',
  color14 = '#637787',
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