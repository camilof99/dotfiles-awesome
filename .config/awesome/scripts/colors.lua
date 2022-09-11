local awesome = awesome
local round = require("gears.math").round
local gears_debug = require("gears.debug")
local xresources = {}
local fallback = {
  color0 = '#030101',
  color1 = '#6a1817',
  color2 = '#6c211f',
  color3 = '#812727',
  color4 = '#8b2e2d',
  color5 = '#7e3a3a',
  color6 = '#984342',
  color7 = '#818080',
  color8 = '#424040',
  color9 = '#8E211F',
  color10 = '#902C2A',
  color11 = '#AD3534',
  color12 = '#BA3E3D',
  color13 = '#A94E4E',
  color14 = '#CB5A58',
  color15 = '#c0bfbf',
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