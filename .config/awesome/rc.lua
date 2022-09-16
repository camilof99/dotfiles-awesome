
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

local xcolors = require("scripts/colors")
local colors = xcolors.get_current_theme()

local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local logout_popup = require("awesome-wm-widgets.logout-popup-widget.logout-popup")

local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local cw = calendar_widget({
    theme = 'nord',
    placement = 'top_right',
    start_sunday = false,
    radius = 8,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "mytheme.lua")

modkey = "Mod4"

--mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                     menu = mymainmenu })
mylauncher = awful.widget.launcher({ image = gears.filesystem.get_configuration_dir() .. "icon-hulk2.png",  command = "rofi -no-lazy-grab -show drun -modi drun -theme " .. gears.filesystem.get_configuration_dir() .. "scripts/rofi.rasi" })

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)

screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)

mykeyboardlayout = awful.widget.keyboardlayout()

mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "", "", "", "ﱘ", "", "", "", "" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style    = {
            spacing = 4,
            shape        = function(cr,w,h)
                             gears.shape.rounded_rect(cr,w,h,4)
                            end,
        },
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        },
    }

    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,

        style    = {
            spacing = 5,
            shape        = function(cr,w,h)
                             gears.shape.rounded_rect(cr,w,h,5)
                            end,
        },

        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250, } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        },
    }

    mytaglistcontainer = wibox.container.margin (s.mytaglist, 4, 4, 3, 3)
    mylaunchercontainer = wibox.container.margin (mylauncher, 7, 2, 2, 2)
    mytasklistcontainer = wibox.container.margin (s.mytasklist, 4, 4, 4, 4)
    mylayoutboxcontainer = wibox.container.margin (s.mylayoutbox, 4, 4, 4, 4)

    local container =
        wibox.widget {
        net_speed_widget(),
        widget = wibox.container.background,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
        end,
        bg = colors.color4,
        fg = colors.color0,
        --fg = "#49B265",
        border_width = (2),
        border_color = '#1b1d2488',
        forced_width = 158
    }myvolumecontainer = wibox.container.margin (
        volume_widget{
        widget_type = 'arc',
        main_color = colors.color7,
    }, 6, 6, 4, 4)

    local container2 =
        wibox.widget {
        myvolumecontainer,
        forced_width = 35,
        widget = wibox.container.background,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
        end,
        --bg = colors.color4,
        --border_width = (2),
        --border_color = '#1b1d2488'
    }

    local container3 =
        wibox.widget {
        mylayoutboxcontainer,
        widget = wibox.container.background,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
        end,
        bg = colors.color4,
        border_width = (2),
        border_color = '#1b1d2488',
    }

    local container4 =
        wibox.widget {
        logout_popup.widget{},
        widget = wibox.container.background,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
        end,
        bg = colors.color4,
        border_width = (2),
        border_color = '#1b1d2488',
    }

    local clock = wibox.widget({
        font = "HackNerdFont Bold 11",
        format = "%H:%M",
        align = "center",
        valign = "center",
        widget = wibox.widget.textclock,
    })

    clock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

    local container5 =
        wibox.widget {
        clock,
        widget = wibox.container.background,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
        end,
        bg = colors.color4,
        fg = colors.color0,
        border_width = (2),
        border_color = '#1b1d2488',
        forced_width = 60
    }

    local systray = wibox.widget.systray()
    systray:set_base_size(28)

    mylayoutcontainer1 = wibox.container.margin (container3, 0, 1.5, 1.5, 1.5)
    mylayoutcontainer2 = wibox.container.margin (container4, 0, 0, 1.5, 1.5)
    clockcontainer = wibox.container.margin (container5, 1.5, 0, 1.5, 1.5)
    myvolumecontainer1 = wibox.container.margin (container2, 0, 0, 1.5, 1.5)
    myspeedcontainer = wibox.container.margin (container, 1.5, 0, 1.5, 1.5)

    s.mywibox0 = awful.wibar {
        position = "top",
        visible = true,
        stretch  = false,
        width    = 40,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        height = 30,
        margins = {
            top = 12,
            left = 14,
        },
        align    = "left",
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylaunchercontainer
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal
            }
        },
    }

    s.mywibox1 = awful.wibar {
        position = "top",
        visible = true,
        stretch  = false,
        width    = 236,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        height = 30,
        margins = {
            top = -18,
            left = 62,
        },
        align    = "left",
        widget   = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
            },
            mytaglistcontainer,
            {
                layout = wibox.layout.fixed.horizontal
            },
        },
    }

    s.mywibox2 = awful.wibar {
        position = "top",
        visible = true,
        stretch  = false,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        width    = 120,
        height = 30,
        margins = {
            top = -48,
            left = 306,
        },
        align    = "left",
        widget   = {
            align  = "center",
            widget = mytasklistcontainer
        },
    }

    s.mywibox3 = awful.wibar {
        position = "top",
        visible = true,
        stretch  = false,
        width    = 116,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        height = 30,
        margins = {
            top = -78,
            right = 14
        },
        align    = "right",
        widget   = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                clockcontainer,
            },
            layout = wibox.layout.fixed.horizontal,
            mylayoutcontainer2,
            {
                layout = wibox.layout.fixed.horizontal,
                mylayoutcontainer1,
            },
        }
    }

    s.mywibox4 = awful.wibar {
        position = "top",
        visible = true,
        stretch  = false,
        width    = 192,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        height = 30,
        margins = {
            top = -108,
            right = 138
        },
        align    = "right",
        widget   = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.layout.fixed.horizontal,
            myspeedcontainer,
            {
                layout = wibox.layout.fixed.horizontal,
                myvolumecontainer1
            }
        }
    }
    s.mywibox5 = awful.wibar {
        position = "top",
        visible = false,
        stretch  = false,
        width    = 100,
        bg = "#061A23",
        border_color = colors.color3,
        border_width = 1,
        height = 30,
        margins = {
            top = -138,
            right = 338
        },
        align    = "right",
        widget   = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.layout.fixed.horizontal,
            systray,
            {
                layout = wibox.layout.fixed.horizontal,
            }
        }
    }
end)

-- }}}

-- {{{ Key bindings
-- General Awesome keys

require("configuration")

-- Autostart Apps
awful.spawn.with_shell("~/.config/awesome/scripts/autostart.sh")