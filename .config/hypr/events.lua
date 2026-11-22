----------------------------
---- EVENTS (AUTOSTART) ----
----------------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

hl.on("hyprland.start", function()
	-- Apps
	hl.exec_cmd("discord")
	hl.exec_cmd("fluxer", { workspace = "F silent", monitor = "DP-1" })
	hl.exec_cmd("openrgb --startminimized")

	-- Components
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst || sleep 15; dunst") -- If dunst fails, then try again after 15 seconds
	hl.exec_cmd("flameshot")
	hl.exec_cmd("cursor-clip-daemon")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- Just in case XDPH doesn't work, uncomment this & restart
	-- hl.exec_cmd("~/.config/hypr/scripts/fix-XDPH.sh")
end)

hl.on("hyprland.shutdown", function()
	-- stop polkit agent, just in case I swap to KDE
	hl.exec_cmd("systemctl --user stop hyprpolkitagent")
end)

-- Events for windows that are commonly floated
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
