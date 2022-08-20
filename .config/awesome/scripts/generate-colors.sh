#!/bin/sh
#!/usr/bin/env bash
#!/bin/env bash

file_json='$HOME/.cache/wal/colors.json'
colors="cat $file_json | grep "color" | cut -d':' -f2 | tail -16"
color=$(eval "$colors")

declare -a data

rm colors.lua && touch colors.lua

for i in ${color[@]}
do
    data+=(${i//[$;,:*%()\#&\/\"]/})
done

VAR0="""local awesome = awesome\nlocal round = require('gears.math').round\nlocal gears_debug = require('gears.debug')\nlocal xresources = {}\nlocal fallback = {"""

echo -e $VAR0 >> colors.lua

for ((i = 0 ; i < 16 ; i++))
do
  VAR1="\tcolor$i = '#${data[$i]}',"
  echo -e $VAR1 >> colors.lua
done

echo -e '}\n' >> colors.lua

VAR2="""function xresources.get_current_theme()\n\tlocal keys = { 'background', 'foreground' }\n\tfor i=0,15 do table.insert(keys, 'color'..i) end\n\tlocal colors = {}\n\tfor _, key in ipairs(keys) do\n\t\tlocal color = awesome.xrdb_get_value('', key)\n\t\tcolor = fallback[key]\n\t\tcolors[key] = color\n  \tend\n\treturn colors\nend\nreturn xresources"""

echo -e $VAR2 >> colors.lua
