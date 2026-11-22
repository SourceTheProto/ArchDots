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

-- This configuration is all divvied up into sub modules, just so that the hypr*
-- name isn't ambiguous with hyprlock.conf and hyprpaper.conf for autocomplete

-- Modules
require("config")
require("rules")
require("keybinds")
require("displays")
require("environment")
require("events")
