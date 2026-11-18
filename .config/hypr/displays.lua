------------------
---- DISPLAYS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/

-- Default for new connected monitors
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- Primary Display
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@144",
    position = "0x0",
    scale    = "1",
})

-- Secondary Display
hl.monitor({
    output   = "DP-1",
    mode     = "1440x900@74.98",
    position = "2560x540",
    scale    = "1",
})
