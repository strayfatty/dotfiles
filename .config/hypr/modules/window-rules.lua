--------------------
--- Window Rules ---
--------------------

hl.window_rule({
  name = "Emacs",
  match = {
    class = "Emacs",
  },

  workspace = "1",
})

hl.window_rule({
  name = "DEV Browser",
  match = {
    class = "google-chrome",
  },

  workspace = "2",
})

hl.window_rule({
  name = "Coding Agent",
  match = {
    initial_class = "t3code",
  },

  workspace = "3",
})

hl.window_rule({
  name = "Lazygit",
  match = {
    initial_title = "lazygit",
  },

  workspace = "4",
})

hl.window_rule({
    name = "LazygitFloating",
    match = {
      initial_title = "lazygit-floating"
    },

    float = true,
    center = true,
    size = "(monitor_w*0.95) (monitor_h*0.9)",
    no_anim = true,
})

hl.window_rule({
  name = "Main Browser",
  match = {
    class = "helium",
  },

  workspace = "9",
  focus_on_activate = true,
})

hl.window_rule({
  name = "Steam",
  match = {
    class = "steam",
  },

  workspace = "10",
})
