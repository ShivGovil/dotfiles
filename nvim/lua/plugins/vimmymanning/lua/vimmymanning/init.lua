-- init.lua for vimmymanning plugin
local M = {}

-- Function to open a floating window with man page content
function M.show_man_page()
  -- Get the word under cursor
  local cword = vim.fn.expand('<cword>')
  if cword == "" then
    vim.notify("No word under cursor", vim.log.levels.WARN)
    return
  end

  -- Get the content of the man page
  local man_cmd = "MANWIDTH=120 man " .. cword .. " 2>/dev/null | col -b"
  local man_content = vim.fn.system(man_cmd)
  
  if man_content == "" or vim.v.shell_error ~= 0 then
    vim.notify("No man page found for '" .. cword .. "'", vim.log.levels.WARN)
    return
  end

  -- Split content into lines properly
  local lines = {}
  for line in vim.gsplit(man_content, "\n") do
    table.insert(lines, line)
  end

  -- Calculate window dimensions
  local width = math.min(120, math.floor(vim.o.columns * 0.8))
  local height = math.min(100, math.floor(vim.o.lines * 0.8))
  
  -- Calculate starting position
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create buffer for the floating window
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Safely set lines
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  
  -- Create the floating window
  local win_id = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = "Man Page: " .. cword,
    title_pos = 'center',
  })

  -- Set window options
  vim.api.nvim_win_set_option(win_id, 'wrap', true)
  vim.api.nvim_win_set_option(win_id, 'cursorline', true)

  -- Set buffer options AFTER setting lines
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'filetype', 'man')

  -- Set keymaps to close the window
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', {noremap = true, silent = true})
end

-- Setup function to be called when loading the plugin
function M.setup(opts)
  -- Set up keymapping
  vim.keymap.set('n', '<leader>m', M.show_man_page, {
    noremap = true,
    silent = true,
    desc = "Show man page for word under cursor"
  })
end

return M
