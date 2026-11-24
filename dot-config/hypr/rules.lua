----------------------------------------
---- WINDOW, LAYER, WORKSPACE RULES ----
----------------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/
-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Keep transient windows near where they were called for floating
hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },

	move = "monitor_w-950-16 50",
	size = {950, 650},
	float = true,
})

hl.window_rule({
	match = { class = "com.saivert.pwvucontrol" },

	move = "monitor_w-960-16 50",
	size = {960, 650},
	float = true,
})

hl.window_rule({
	match = { class = "MEGAsync" },
	move = "monitor_w-402-16 50",
})

-- flameshot monitor selector
hl.window_rule({
	match = {
	        class = "flameshot",
		fullscreen = 0,
	},

	float = true,
})

hl.window_rule({
	match = {
	        class = "blender",
		title = "Preferences",
	},

	float = true,
})

hl.window_rule({
	match = {
	        class = "org.openrgb.OpenRGB",
	},

	size = {1130, 650},
	float = true,
})

-- Force apps to open on second monitor workspaces
hl.window_rule({ match = { class = "spotify" },                  workspace = "S",   monitor = "DP-1", })
hl.window_rule({ match = { class = "discord" },                  workspace = "D",   monitor = "DP-1", })
hl.window_rule({ match = { title = "Discord Popout" },           workspace = "D-P", monitor = "DP-1", })
hl.window_rule({ match = { class = "app.fluxer.FluxerDesktop" }, workspace = "F",   monitor = "DP-1", })
hl.window_rule({ match = { class = "org.telegram.desktop" },     workspace = "T",   monitor = "DP-1", })

-- Hide clipboard from screenshares for privacy
hl.layer_rule({ match = { namespace = "cursor-clip" }, no_screen_share = true, })

-- Make workspace 1 the default for my main monitor
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true, })
