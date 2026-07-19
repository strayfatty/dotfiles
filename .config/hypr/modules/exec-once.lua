-----------------
--- Exec Once ---
-----------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("goxlr-daemon")
  hl.exec_cmd("quickshell")
  hl.exec_cmd("mpd")
  hl.exec_cmd("syncthing")
end)
