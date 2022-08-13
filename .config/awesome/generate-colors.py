import json

with open('/home/kaneki99/.cache/wal/colors.json') as archivo:
    data = json.load(archivo)

arch = open("colors.lua", "w")
arch.write('local awesome = awesome\nlocal round = require("gears.math").round\n'
    +'local gears_debug = require("gears.debug")\nlocal xresources = {}\n'
    +"local fallback = {\n")

for x in range(len(data['colors'])):
    value =  "color" + '{}'.format(x)
    arch.write("  " + value + " = '" + data['colors'][value] + "',\n")

arch.write("}\n")
arch.write("function xresources.get_current_theme()\n"
    + "  local keys = { 'background', 'foreground' }\n"
    + '  for i=0,15 do table.insert(keys, "color"..i) end\n'
    + "  local colors = {}\n"
    + "  for _, key in ipairs(keys) do\n"
    + '    local color = awesome.xrdb_get_value("", key)\n'
    + "    color = fallback[key]\n"
    + "    colors[key] = color\n"
    + "  end\n"
    + "  return colors\n"
    + "end\n"
    + "return xresources")

