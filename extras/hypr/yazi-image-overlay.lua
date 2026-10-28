-- Keep ueberzug image overlays out of the tiling layout.
-- ueberzugpp 2.9.10 uses pre-Lua Hyprland IPC, so its own rules do not apply.
o.window("^ueberzugpp.*$", {
  name = "yazi-image-overlay",
  float = true,
  no_focus = true,
  no_anim = true,
  no_blur = true,
  no_shadow = true,
  border_size = 0,
  rounding = 0,
})
