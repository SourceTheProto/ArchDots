--  ____                           _
-- / ___|  ___  _   _ _ __ ___ ___( )___
-- \___ \ / _ \| | | | '__/ __/ _ \// __|
--  ___) | (_) | |_| | | | (_|  __/ \__ \
-- |____/ \___/ \__,_|_|  \___\___| |___/
--
--  _   _                  _                 _   _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| | | |   _   _  __ _
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` | | |  | | | |/ _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| | | |__| |_| | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_| |_____\__,_|\__,_|
--        |___/|_|

-- Modules
require("keybinds")
require("displays")
require("environment")
require("events")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 10,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(59,165,255,0.85)", "rgba(33,176,179,0.85)" }, angle = 45 },
			inactive_border = "rgba(89,89,89,0.66)",
		},

		resize_on_border = false, -- Resize by clicking and dragging on borders of windows
		allow_tearing = true, -- please see https://wiki.hypr.land/configuring/extra/tearing/ (basically just add an immidiate window rule
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 3,
			render_power = 3,
			color = "rgba(170,170,170,0.8)",
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		session_lock_xray = true,
		session_lock_blur = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/configuring/layouts/scrolling-layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

----------------
---- LAYERS ----
----------------

hl.config({
	layers = {
		allow_new_top_layers_over_existing_fullscreen = true, -- Set to false to make newly mapped top layers render below existing covering fullscreen window
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = true,

		follow_mouse = 1,

		sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

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

-- Keep Pavucontrol at the top right, floating
hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },

	move = "monitor_w-950-16 50",
	size = {950, 650},
	float = true,
})

-- Keep mega at the top right, floating
hl.window_rule({
	match = { class = "MEGAsync" },

	move = "monitor_w-402-16 50",
})

-- Keep flameshot monitor selector floating in the center
hl.window_rule({
	match = {
	        class = "flameshot",
		fullscreen = 0,
	},

	float = true,
})

-- make blender preferences float
hl.window_rule({
	match = {
	        class = "blender",
		title = "Preferences",
	},

	float = true,
})

hl.window_rule({
	match = {
	        class = "kitty",
		float = true,
	},

	size = {1020, 650},
})

-- Force apps to open on second monitor workspaces
hl.window_rule({ match = { class = "spotify" },                  workspace = "6", monitor = "DP-1", })
hl.window_rule({ match = { class = "discord" },                  workspace = "7", monitor = "DP-1", })
hl.window_rule({ match = { title = "Discord Popout" },           workspace = "5", monitor = "DP-1", })
hl.window_rule({ match = { class = "app.fluxer.FluxerDesktop" }, workspace = "8", monitor = "DP-1", })
hl.window_rule({ match = { class = "org.telegram.desktop" },     workspace = "9", monitor = "DP-1", })

-- Hide clipboard from screenshares for privacy
hl.layer_rule({ match = { namespace = "cursor-clip" }, no_screen_share = true, })

-- Make workspace 1 the default for my main monitor
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true, })
