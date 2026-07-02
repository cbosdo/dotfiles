local bugzilla_ns = vim.api.nvim_create_namespace("bugzilla_links")

local function apply_bugzilla_links(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(bufnr, bugzilla_ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for row, line in ipairs(lines) do
    local start_idx = 1
    while true do
      -- Lua pattern to look for bsc# followed by numbers
      local s, e = line:find("bsc#%d+", start_idx)
      if not s then break end

      local bug_id = line:sub(s + 4, e) -- extract digits after "bsc#"
      local url = "https://bugzilla.suse.com/show_bug.cgi?id=" .. bug_id

      -- Create the real terminal hyperlink + styling
      vim.api.nvim_buf_set_extmark(bufnr, bugzilla_ns, row - 1, s - 1, {
        end_col = e,
        hl_group = "Underlined", -- Formats it visually like a link
        url = url,               -- This triggers OSC 8 in Kitty terminal
      })

      start_idx = e + 1
    end
  end
end

-- Automatically run this whenever you open, read, or modify a buffer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TextChanged", "TextChangedI" }, {
  group = vim.api.nvim_create_augroup("BugzillaHyperlinks", { clear = true }),
  callback = function(args)
    -- Debounce slightly to ensure smooth typing performance
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(args.buf) then
        apply_bugzilla_links(args.buf)
      end
    end)
  end,
})

