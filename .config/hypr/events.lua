----------------------------
---- EVENTS (AUTOSTART) ----
----------------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	-- Apps
	hl.exec_cmd("discord")
	hl.exec_cmd("fluxer", { workspace = "8 silent", monitor = "DP-1" })

	-- Components
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd("flameshot")
	hl.exec_cmd("cursor-clip --daemon")

	-- Hyprpaper
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("sleep 1; hyprctl hyprpaper wallpaper 'HDMI-A-1, ~/Pictures/Wallpapers/BotW_Landscape.jpg'")
	hl.exec_cmd("sleep 1; hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/Wallpapers/fluffycuddlesnearthefireplace.png'")

	-- start background processes
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Just in case XDPH doesn't work, uncomment this & restart
	-- hl.exec_cmd("~/.config/hypr/scripts/fix-XDPH.sh")
	hl.exec_cmd("sleep 3; hyprctl eval 'fluxerInitial:set_enabled(false)'")
	hl.exec_cmd("sleep 3; hyprctl eval 'fluxerPost:set_enabled(true)'")
end)

hl.on("hyprland.shutdown", function()
	-- stop polkit agent, just in case I swap to KDE
	hl.exec_cmd("systemctl --user stop hyprpolkitagent")
end)

hl.on("window.update_state", function(window, changes)
	if window == nil or changes == nil then
		return
	end

	if changes.float == true then
		if     window.class == "kitty" then
			hl.dispatch(hl.dsp.window.resize({ x = 1020, y = 650 }))
		elseif window.class == "org.kde.dolphin" then
			hl.dispatch(hl.dsp.window.resize({ x = 1120, y = 750 }))
		end
	end
end)
