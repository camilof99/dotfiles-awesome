local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()

-- Credits rxyhn

return {
	--- Default ApplicationsR
	default = {
		--- Default terminal emulator
		terminal = "kitty",
		code_editor = "code",
		web_browser = "microsoft-edge-stable",
		file_manager = "nautilus",
		app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "scripts/rofi.rasi",
		color_picker =  "xcolor -s --scale 6 --preview-size 115",
	},

}