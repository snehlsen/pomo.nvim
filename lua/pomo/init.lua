local M = {}

-- Assign a timeslot to a TODO item
function M.assign_timeslot()
  local line = vim.api.nvim_get_current_line()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, {line .. " ☐"})
end

-- Mark a timeslot as completed
function M.complete_timeslot()
  local line = vim.api.nvim_get_current_line()
  local updated_line = line:gsub("☐", "☑", 1)
  if line == updated_line then
    updated_line = line .. " ✓" -- Mark additional unplanned work
  end
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, {updated_line})
end

-- Pause work on a timeslot
function M.pause_timeslot()
  local line = vim.api.nvim_get_current_line()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, {line .. " ⏸"})
end

function M.new_day_template()
  local date_str = os.date("%Y-%m-%d")
  local underline_str = "----------"
  local work_str = "- work"
  vim.api.nvim_win_set_cursor(0, {1, 0})
  vim.api.nvim_put({date_str, underline_str, work_str}, '', false, true)
end

function M.setup()
  vim.api.nvim_create_user_command('PomoNewDay', M.new_day_template, {})
  vim.api.nvim_create_user_command('PomoAssign', M.assign_timeslot, {})
  vim.api.nvim_create_user_command('PomoComplete', M.complete_timeslot, {})
  vim.api.nvim_create_user_command('PomoPause', M.pause_timeslot, {})
end

return M

