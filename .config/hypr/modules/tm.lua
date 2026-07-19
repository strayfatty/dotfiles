local tm = {}

function tm.focus_direction(dir)
  return hl.dsp.focus({ direction = dir })
end

---@param filters HL.WindowQueryFilter
---@param application string
---@return fun()
function tm.focus_or_exec(filters, application)
  return function()
    local window = hl.get_windows(filters)[1]
    if window then
      hl.dispatch(hl.dsp.focus({ window = window }))
      return
    end

    hl.exec_cmd(application)
  end
end

function tm.focus_or_exec_emacs()
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

return tm
