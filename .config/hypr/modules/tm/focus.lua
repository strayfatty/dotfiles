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

function focus.steam_app()
  local window = hl.get_window("class:steam_app_.*")
  if window then
      hl.dispatch(hl.dsp.focus({ window = window }))
  end
end

function focus.emacs()
  -- Focus the floating Lazygit window first, if it exists.
  local lazygit = hl.get_window("initialtitle:lazygit-floating")
  if lazygit then
    hl.dispatch(hl.dsp.focus({ window = lazygit }))
    return
  end

  -- Otherwise, focus Emacs if it is running.
  local emacs = hl.get_window("class:Emacs")
  if emacs then
    hl.dispatch(hl.dsp.focus({ window = emacs }))
    return
  end

  hl.exec_cmd("emacs")
end

return focus
