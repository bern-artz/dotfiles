------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

--    hl.workspace_rule({ workspace = "6", persistent = true})
hl.workspace_rule ({
    workspace = "6",
    gaps_out = 5,
    gaps_in  = 5,

})

-- unscale XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})
