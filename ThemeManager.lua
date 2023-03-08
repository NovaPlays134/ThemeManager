--created by Nova_Plays these themes are not mine im not taking any credits from them--

util.keep_running()
util.require_natives(1663599433)

-----------------
--update system--
-----------------
--hexarobi's auto-updater--
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
        function(result, headers, status_code)
            local function parse_auto_update_result(result, headers, status_code)
                local error_prefix = "Error downloading auto-updater: "
                if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
            end
            auto_update_complete = parse_auto_update_result(result, headers, status_code)
        end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

local default_check_interval = 604800
local auto_update_config = {
    source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/ThemeManager.lua",
    script_relpath=SCRIPT_RELPATH,
    switch_to_branch=selected_branch,
    verify_file_begins_with="--",
    check_interval=86400,
    silent_updates=true,
    dependencies={
        {
            name="2Stand1",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/2Stand1.png",
            script_relpath="resources/Theme_Manager/2Stand1.png",
            check_interval=default_check_interval,
        },

        {
            name="2Take1",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/2Take1.png",
            script_relpath="resources/Theme_Manager/2Take1.png",
            check_interval=default_check_interval,
        },

        {
            name="AcJoker",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/AcJoker.png",
            script_relpath="resources/Theme_Manager/AcJoker.png",
            check_interval=default_check_interval,
        },

        {
            name="Administrator_Tool",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/Administrator_Tool.png",
            script_relpath="resources/Theme_Manager/Administrator_Tool.png",
            check_interval=default_check_interval,
        },

        {
            name="Kiddions",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/Kiddions.png",
            script_relpath="resources/Theme_Manager/Kiddions.png",
            check_interval=default_check_interval,
        },

		{
            name="Optimum",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/Optimum.png",
            script_relpath="resources/Theme_Manager/Optimum.png",
            check_interval=default_check_interval,
        },

        {
            name="Stand_Roses",
            source_url="https://raw.githubusercontent.com/NovaPlays134/ThemeManager/main/resources/Theme_Manager/Stand_Roses.png",
            script_relpath="resources/Theme_Manager/Stand_Roses.png",
            check_interval=default_check_interval,
        },

    }
}
auto_updater.run_auto_update(auto_update_config)

--
local themes = {"Default", "2Stand1", "2Take1", "Rockstar Admin Tools", "Optimum", "Kiddions", "Stand Roses", "12s Theme", "Administrator Tool", "AcJokerScript"}
local theme_number = 1
menu.list_select(menu.my_root(), "Select Theme", {}, "",  themes, 1, function(index)
    theme_number = index
end)

function updateHeader(number)
    local username = os.getenv("USERNAME")
    local src_dir = "C:\\Users\\" .. username .. "\\AppData\\Roaming\\Stand\\Lua Scripts\\resources\\Theme_Manager"
    local dest_dir = "C:\\Users\\" .. username .. "\\AppData\\Roaming\\Stand\\Headers\\Custom Header"
    
    local header1_filename = "2Stand1.png"
    local header2_filename = "2Take1.png"
    local header3_filename = "Optimum.png"
    local header4_filename = "Kiddions.png"
    local header5_filename = "Stand_Roses.png"
    local header6_filename = "Administrator_Tool.png"
    local header7_filename = "AcJoker.png"

    local header_filename = ""
    if number == 2 then
      header_filename = header1_filename
    elseif number == 3 then
      header_filename = header2_filename
    elseif number == 5 then
        header_filename = header3_filename
    elseif number == 6 then
        header_filename = header4_filename
    elseif number == 7 then
        header_filename = header5_filename
    elseif number == 9 then
        header_filename = header6_filename
    elseif number == 10 then
        header_filename = header7_filename
    end
    os.remove(dest_dir .. "\\" .. header1_filename)
    os.remove(dest_dir .. "\\" .. header2_filename)
    os.remove(dest_dir .. "\\" .. header3_filename)
    os.remove(dest_dir .. "\\" .. header4_filename)
    os.remove(dest_dir .. "\\" .. header5_filename)
    os.remove(dest_dir .. "\\" .. header6_filename)
    os.remove(dest_dir .. "\\" .. header7_filename)

    local header_src_path = src_dir .. "\\" .. header_filename
    local header_src_file = io.open(header_src_path, "rb")
    local header_dest_path = dest_dir .. "\\" .. header_filename
    local header_dest_file = io.open(header_dest_path, "wb")

    header_dest_file:write(header_src_file:read("*all"))
    header_src_file:close()
    header_dest_file:close()
end

menu.action(menu.my_root(), "Apply Theme", {}, "", function()
local username = os.getenv("USERNAME")
local file_path = "C:\\Users\\" .. username .. "\\AppData\\Roaming\\Stand\\Profiles\\Theme_Manager.txt"
local file = io.open(file_path, "r")
local contents = file:read("*all")


file:close()
if theme_number == 1 then
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Lua Scripts
		ThemeManager: On]]

elseif theme_number == 2 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
    Settings
        Appearance
            Colours
                Primary Colour: FFFFFFFF
                Focused Text Colour: 000000FF
                Focused Right-Bound Text Colour: 000000FF
                Focused Texture Colour: 000000FF
                Background Colour: 000000A0
            Header
                Header: Custom
            Address Bar
                Address Bar: Off
                Root Name: Hidden
            Tabs
                Width: 62
                Height: 25
                Position: Top
                Text
                    Scale: 11
                Text Alignment: Centre
            Notifications
                Border Colour: FFFFFFFF
                Flash Colour: 00000088
                Background Colour: 00000088
            Commands
                Text
                    Scale: 13
            Max Visible Commands: 12
            List Width: 434
            List Height: 28
            Spacer Size: 0
            Background Blur: 0
            Font & Text
                Small Text
                    Scale: 11
                    X Offset: -1
                    Y Offset: 3
    Lua Scripts
        ThemeManager: On
            Select Theme: 2Stand1
]]

elseif theme_number == 3 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
    Settings
        Appearance
            Colours
                Primary Colour: FFFFFFFF
                Focused Text Colour: 000000FF
                Focused Right-Bound Text Colour: 000000FF
                Focused Texture Colour: 000000FF
                Background Colour: 000000A0
            Header
                Header: Custom
            Address Bar
                Address Bar: Off
                Root Name: Hidden
            Tabs
                Width: 62
                Height: 25
                Position: Top
                Text
                    Scale: 11
                Text Alignment: Centre
            Notifications
                Border Colour: FFFFFFFF
                Flash Colour: 00000088
                Background Colour: 00000088
            Commands
                Text
                    Scale: 13
            Max Visible Commands: 12
            List Width: 434
            List Height: 28
            Spacer Size: 0
            Background Blur: 0
            Font & Text
                Small Text
                    Scale: 11
                    X Offset: -1
                    Y Offset: 3
    Lua Scripts
        ThemeManager: On
            Select Theme: 2Take1
]]

elseif theme_number == 4 then
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: FFAA00FF
				Focused Text Colour: 000000FF
				Focused Right-Bound Text Colour: 000000FF
				Focused Texture Colour: 000000FF
				Background Colour: 00000078
				HUD Colour: FFAA00FF
				AR Colour: FFAA00FF
				Minigame Colour: FFAA00FF
			Header
				Header: Rockstar Admin Tools
			Address Bar
				Address Separator: Stand / Online
				Show Current List Only: On
				Height: 38
				Text
					Scale: 18
			Cursor
				Rounded: On
				Colour: FFAA00FF
			Tabs
				Height: 35
				Text
					Scale: 17
			Scrollbar
				Width: 5
			Command Info Text
				Position: Bottom
			Notifications
				Type: Game
				Border Colour: FFAA00FF
				Flash Colour: FFAA00FF
			Commands
				Text
					Scale: 17
			Border
				Width: 3
				Rounded: On
				Colour: FFAA00FF
			Max Visible Commands: 15
			List Height: 35
			Smooth Scrolling: 100
			Font & Text
				Small Text
					Scale: 16
    Lua Scripts
        ThemeManager: On
            Select Theme: Rockstar Admin Tools
]]

elseif theme_number == 5 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
    Settings
        Appearance
            Colours
                Primary Colour: EFF4EFFF
                Focused Text Colour: 202121FF
                Focused Right-Bound Text Colour: 202121FF
                Focused Texture Colour: 202121FF
                Background Colour: 202121FF
                Unfocused Text Colour: EFF4EFFF
                Unfocused Right-Bound Text Colour: EFF4EFFF
                Unfocused Texture Colour: EFF4EFFF
                HUD Colour: EFF4EFFF
                AR Colour: EFF4EFFF
                Minigame Colour: EFF4EFFF
            Header
                Header: Custom
            Address Bar
                Root Name: Hidden
                Address Separator: Stand \ Online
                Height: 27
                Text
                    X Offset: 0
                    Y Offset: 3
                Show Cursor Position: On
            Cursor
                Width: 2
                Rounded: On
                Colour: EFF4EFFF
            Tabs
                Width: 70
                Position: Top
                Text
                    X Offset: 0
                    Y Offset: 1
                Text Alignment: Centre
                Show Icon Left: On
                Show Name: Off
            Scrollbar
                Width: 5
            Notifications
                Border Colour: EFF4EFFF
                Flash Colour: 202121FF
                Background Colour: 202121FF
            Commands
                Text
                    Y Offset: 3
            Border
                Width: 5
                Rounded: On
                Colour: 202121FF
            List Width: 490
            List Height: 33
            Spacer Size: 13
            Font & Text
                Command Box Input Text
                    Y Offset: 3
                Small Text
                    Y Offset: 3
        Info Text
            Scale: 18
    Lua Scripts
        ThemeManager: On
            Select Theme: Optimum
]]

elseif theme_number == 6 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: D8C45FFF
				Focused Text Colour: 082735FF
				Focused Right-Bound Text Colour: 082735FF
				Focused Texture Colour: 082735FF
				Background Colour: 082735B4
				Unfocused Text Colour: E6E6F5FF
				Unfocused Right-Bound Text Colour: E6E6F5FF
				Unfocused Texture Colour: E6E6F5FF
				HUD Colour: E2B5C7FF
				AR Colour: B6DCE0FF
				Minigame Colour: E2B5C7FF
			Header
				Header: Custom
			Address Bar
				Address Bar: Off
				Root Name: Kiddion's VIP Menu {}
				Address Separator: Stand/Online
				Width Affected By Scrollbar: On
				Show Cursor Position: On
			Cursor
				Scroll Gap: 0
				Colour: 464E6EFA
			Tabs
				Tabs: Off
			Scrollbar
				Scrollbar: Disabled
				Width: 3
			Command Info Text
				Position: Bottom
				Width: 255
				Show Help Text: Off
				Show Command Syntax: Off
				Indicate Slider Behaviour: Off
				Indicate If Usable By Other Players: Off
			Notifications
				Type: Game
				Width: 350
				Border Colour: 3996DDFF
				Flash Colour: 3996DDFF
				Background Colour: 00000096
			Commands
				Text
					Scale: 10
			Border
				Colour: 141E41FA
			Max Visible Commands: 35
			List Width: 280
			List Height: 18
			Spacer Size: 0
			Smooth Scrolling: 0
			Background Blur: 0
			Font & Text
				Small Text
					Scale: 9
			Stream-Proof Rendering: On
    Lua Scripts
        ThemeManager: On
            Select Theme: Kiddions
]]

elseif theme_number == 7 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: FF0044FF
				Background Colour: 070707FA
				HUD Colour: FFFFFFFF
				AR Colour: FF0044FF
				Minigame Colour: FF0044FF
			Header
				Header: Custom
			Address Bar
				Address Bar: Off
				Root Name: Hidden
				Address Separator: Stand/Online
				Show Cursor Position: On
			Cursor
				Colour: FFFFFFFF
			Tabs
				Width: 54
				Height: 27
				Position: Top
				Text
					Scale: 11
					X Offset: 11
					Y Offset: 6
				Show Name: Off
				Show Icon Right: On
			Scrollbar
				Scrollbar: Disabled
			Command Info Text
				Position: Bottom
			Notifications
				Type: Stand, Custom Position
				Custom Position: 456, 1053
				Border Colour: 00000000
				Flash Colour: FF0044FF
				Background Colour: 000000A3
			Commands
				Text
					Scale: 14
			Border
				Width: 5
				Rounded: On
				Colour: FF0044FF
			Max Visible Commands: 16
			List Width: 378
			List Height: 26
			Spacer Size: 4
			Smooth Scrolling: 50
			Background Blur: 0
			Font & Text
				Command Box Input Text
					Scale: 17
				Small Text
					Scale: 11
		Info Text
			Position: 278, 936
			Alignment: Top Left
			Scale: 18
    Lua Scripts
        ThemeManager: On
            Select Theme: Stand Roses
]]

elseif theme_number == 8 then
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: 191919FF
				Background Colour: 020202FF
				Unfocused Text Colour: 4C4C4CFF
				Unfocused Right-Bound Text Colour: 4C4C4CFF
				Unfocused Texture Colour: 494949FF
				HUD Colour: FFFFFFFF
				AR Colour: EFF4EFFF
				Minigame Colour: EFF4EFFF
			Address Bar
				Root Name: Hidden
				Address Separator: Stand\Online
				Width Affected By Scrollbar: On
				Height: 27
				Text
					X Offset: 0
					Y Offset: 3
			Cursor
				Scroll Gap: 3
				Colour: 592300FF
			Tabs
				Width: 71
				Position: Top
				Text
					X Offset: 0
					Y Offset: 1
				Text Alignment: Centre
				Show Icon Left: On
				Show Name: Off
			Scrollbar
				Scrollbar: Enabled
			Command Info Text
				Indicate If Usable By Other Players: Off
			Notifications
				Custom Position: 466, 627
				Border Colour: 191919FF
				Flash Colour: 0C0C0CC8
				Background Colour: 000000C8
			Commands
				Text
					Y Offset: 3
			Border
				Width: 1
				Colour: 333333FF
			Max Visible Commands: 12
			List Width: 490
			Spacer Size: 1
			Background Blur: 10
			Font & Text
				Command Box Input Text
					Y Offset: 3
				Small Text
					X Offset: -3
					Y Offset: 3
		Info Text
			Scale: 18
    Lua Scripts
        ThemeManager: On
            Select Theme: 12s Theme
]]

elseif theme_number == 9 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: 19191A32
				Background Colour: 14141496
				HUD Colour: FFFFFFFF
				AR Colour: FF0000FF
				Minigame Colour: FF0000FF
			Header
				Header: Custom
			Address Bar
				Address Bar: Off
				Root Name: Hidden
				Address Separator: Stand/Online
				Show Cursor Position: On
			Cursor
				Width: 1
				Colour: FFFFFFFF
			Tabs
				Width: 59
				Position: Top
				Text Alignment: Centre
				Show Name: Off
				Show Icon Right: On
			Scrollbar
				Scrollbar: Disabled
			Command Info Text
				Position: Bottom
				Indicate Slider Behaviour: Off
			Notifications
				Custom Position: 323, 1060
				Border Colour: FFFFFFFF
				Flash Colour: C8C8C84B
				Background Colour: 14141996
			Border
				Width: 1
				Colour: FFFFFFFF
			Max Visible Commands: 12
			List Width: 413
			Spacer Size: 1
			Smooth Scrolling: 100
			Background Blur: 10
			Font & Text
				Big Text
					Scale: 13
					Y Offset: 5
		Info Text
			Position: 1574, 451
			Alignment: Centre
			Scale: 13
		Notifications
			Suppress Generic Responses
				Command Box: On
    Lua Scripts
        ThemeManager: On
            Select Theme: Administrator Tool
]]

elseif theme_number == 10 then
updateHeader(theme_number)
contents = [[Finished Tutorial: Yes
Understands Commands: Yes
Understands Sliders: Yes
Understands Profiles: Yes
Tree Compatibility Version: 44
Stand
	Settings
		Appearance
			Colours
				Primary Colour: 8F00FFFF
				Focused Text Colour: 32CD32FF
				Focused Right-Bound Text Colour: 32CD32FF
				Focused Texture Colour: 32CD32FF
				Background Colour: 00000000
				Unfocused Text Colour: 32CD32FF
				Unfocused Right-Bound Text Colour: 32CD32FF
				Unfocused Texture Colour: 32CD32FF
				HUD Colour: 8F00FFFF
				AR Colour: 8F00FFFF
				Minigame Colour: 8F00FFFF
			Header
				Header: Custom
			Scrollbar
				Scrollbar: Disabled
			Notifications
				Border Colour: A020F0FF
			Border
				Width: 2
				Colour: 8F00FFFF
			Background Blur: 0
			Stream-Proof Rendering: On
	Lua Scripts
		ThemeManager: On
			Select Theme: AcJokerScript
]]

end
    file = io.open(file_path, "w")
    file:write(contents)
    file:close()
    menu.trigger_commands("loadTheme_Manager")
end)

menu.action(menu.my_root(), "Check for Update", {}, "The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
    auto_update_config.check_interval = 0
    if auto_updater.run_auto_update(auto_update_config) then
        util.toast("No updates found")
    end
end)
menu.action(menu.my_root(), "Clean Reinstall", {}, "Force an update to the latest version, regardless of current version.", function()
    auto_update_config.clean_reinstall = true
    auto_updater.run_auto_update(auto_update_config)
end)

menu.action(menu.my_root(), "Disclaimer", {}, "I dit not create any of the themes in this script these are all taken from the theme channel in the discord server, so im not taking any credit from them.", function()
    util.toast("I dit not create any of the themes in this script these are all taken from the theme channel in the discord server, so im not taking any credit from them.")
end)