local tm = {}

function tm.focus_direction(dir)
  return hl.dsp.focus({ direction = dir })
end

function tm.focus_emacs()
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

-- tm.focus_or_exec = {}
-- function tm.focus_or_exec.by_class(filter, appliation)
-- end

-- function tm.focus_or_exec.by_initial_class()
-- end

-- function tm.focus_or_exec.by_title()
-- end

-- function tm.focus_or_exec.by_initial_title()
-- end

return tm
