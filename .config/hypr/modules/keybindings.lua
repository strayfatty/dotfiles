local tm = require("modules/tm")

-------------------
--- Keybindings ---
-------------------
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("rofi -show window"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("ALT + SHIFT + F", hl.dsp.window.fullscreen())

-- screenshot
hl.bind("SUPER + CONTROL + P", hl.dsp.exec_cmd(".config/hypr/scripts/takeScreenshot.sh -w"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd(".config/hypr/scripts/takeScreenshot.sh -r"))
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd(".config/hypr/scripts/takeScreenshot.sh -f"))

-- core applications
hl.bind("ALT + 1", tm.focus.emacs)
hl.bind("SUPER + ALT + 1", hl.dsp.exec_cmd("~/.config/emacs/bin/doom run --debug-init"))
hl.bind("ALT + 2", tm.focus.app("google-chrome-stable", { class = "google-chrome" }))
hl.bind("ALT + 3", tm.focus.app("t3code"))
hl.bind("ALT + 4", tm.focus.tui("lazygit"))
hl.bind("ALT + 7", tm.focus.web_app("https://www.amazon.de/-/en/gp/video/storefront", { class = "chrome-www.amazon.de__-_en_gp_video_storefront-Default" }))
hl.bind("ALT + 9", tm.focus.app("helium-browser", { class = "helium" }))
hl.bind("ALT + 0", tm.focus.app("steam"))
hl.bind("ALT + minus", tm.focus.steam_app)
hl.bind("ALT + C", hl.dsp.exec_cmd("alacritty"))

-- other applications
hl.bind("SUPER + S", tm.focus.web_app("http://localhost:8384", { class = "chrome-localhost__-Default" }))
hl.bind("SUPER + A", tm.focus.tui("wiremix"))
hl.bind("SUPER + M", tm.focus.tui("rmpc"))
hl.bind("SUPER + T", tm.focus.tui("htop"))
hl.bind("SUPER + G", tm.focus.web_app("http://localhost:14564", { title = "GoXLR Utility" }))

hl.bind("CONTROL + ALT + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- movement
hl.bind("ALT + H", tm.focus.direction("l"))
hl.bind("ALT + J", tm.focus.direction("d"))
hl.bind("ALT + K", tm.focus.direction("u"))
hl.bind("ALT + L", tm.focus.direction("r"))

hl.bind("ALT + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("ALT + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("ALT + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("ALT + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("ALT + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("ALT + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("ALT + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("ALT + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- temporarily disable all keybinds
hl.bind("CONTROL + ALT + SHIFT + K", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
  hl.bind("CONTROL + ALT + SHIFT + K", hl.dsp.submap("reset"))
end)
