local focus = {}

function focus.direction(dir)
  return hl.dsp.focus({ direction = dir })
end

---@param application string
---@param filters? HL.WindowQueryFilter
---@return fun()
function focus.app(application, filters)
  return function()
    filters = filters or { class = application }

    local window = hl.get_windows(filters)[1]
    if window then
      hl.dispatch(hl.dsp.focus({ window = window }))
      return
    end

    hl.exec_cmd(application)
  end
end

---@param application string
---@param initial_title? string
---@return fun()
function focus.tui(application, initial_title)
  return function()
    initial_title = initial_title or application
    local window = hl.get_window("initialtitle:" .. initial_title)
    if window then
        hl.dispatch(hl.dsp.focus({ window = window }))
        return
    end

    hl.exec_cmd(
      'alacritty -T "' .. initial_title .. '" -e "' .. application .. '"'
    )
  end
end

function focus.steam_app()
  local window = hl.get_window("class:steam_app_.*")
  if window then
      hl.dispatch(hl.dsp.focus({ window = window }))
  end
end

function focus.emacs()
  local lazygit = hl.get_window("initialtitle:lazygit-floating")
  if lazygit then
    hl.dispatch(hl.dsp.focus({ window = lazygit }))
    return
  end

  local emacs = hl.get_window("class:Emacs")
  if emacs then
    hl.dispatch(hl.dsp.focus({ window = emacs }))
    return
  end

  hl.exec_cmd("emacs")
end

return focus
