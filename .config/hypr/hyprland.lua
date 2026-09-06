require("modules/env")
require("modules/monitors")
require("modules/workspaces")
require("modules/input")
require("modules/theme")
require("modules/animations")
require("modules/keybindings")
require("modules/window-rules")
require("modules/exec-once")
local tm = require("modules/tm")

hl.config({
  debug = {
    overlay = false,
    disable_logs = false,
  }
})

hl.on("window.close", function (window)
  if window.class:match("^Minecraft.*$") then
    tm.focus.minecraft()
    return
  end

  if window.class:match("^steam_app_.*$") then
    tm.focus.steam()
    return
  end
end)
