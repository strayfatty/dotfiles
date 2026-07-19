local tm = require("modules/tm")

-------------------
--- Keybindings ---
-------------------
hl.bind("SUPER + Q", hl.dsp.window.kill())
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
hl.bind("ALT + 1", tm.focus_or_exec_emacs)
hl.bind("ALT + 2", tm.focus_or_exec({ class = "google-chrome" }, "google-chrome-stable"))
hl.bind("ALT + 3", tm.focus_or_exec({ class = "t3code" }, "t3code"))
hl.bind("ALT + 4", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecTui.sh -T \"lazygit\" \"lazygit\""))
hl.bind("ALT + 7", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecWebApp.sh --chrome -c \"chrome-www.amazon.de__-_en_gp_video_storefront-Default\" \"https://www.amazon.de/-/en/gp/video/storefront\""))
hl.bind("ALT + 9", tm.focus_or_exec({ class = "helium" }, "helium-browser"))
hl.bind("ALT + 0", tm.focus_or_exec({ class = "steam" }, "steam"))
hl.bind("ALT + minus", hl.dsp.exec_cmd(".config/hypr/scripts/focusSteamApp.sh"))
hl.bind("ALT + C", hl.dsp.exec_cmd("alacritty"))

-- other applications
hl.bind("SUPER + S", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecWebApp.sh --chrome -c \"chrome-localhost__-Default\" \"http://localhost:8384\""))
hl.bind("SUPER + A", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecTui.sh -T \"wiremix\" \"wiremix\""))
hl.bind("SUPER + M", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecTui.sh -T \"rmpc\" \"rmpc\""))
hl.bind("SUPER + T", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecTui.sh -T \"htop\" \"htop\""))
hl.bind("SUPER + G", hl.dsp.exec_cmd(".config/hypr/scripts/focusOrExecWebApp.sh --chrome -t \"GoXLR Utility\" \"http://localhost:14564\""))

hl.bind("CONTROL + ALT + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- movement
hl.bind("ALT + H", tm.focus_direction("l"))
hl.bind("ALT + J", tm.focus_direction("d"))
hl.bind("ALT + K", tm.focus_direction("u"))
hl.bind("ALT + L", tm.focus_direction("r"))

hl.bind("ALT + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("ALT + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("ALT + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("ALT + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("ALT + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("ALT + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("ALT + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("ALT + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
