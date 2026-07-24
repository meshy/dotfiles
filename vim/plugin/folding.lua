vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append({ fold = " " })

vim.keymap.set('n', '<C-space>', function()
  if vim.wo.foldlevel == 0 then
    vim.cmd('normal! zR') -- Open all folds completely
  else
    vim.cmd('normal! zM') -- Close all folds completely
  end
end, { desc = 'Toggle all folds globally' })

vim.keymap.set('n', '<Space>', function()
  -- vim.fn.foldclosed('.') returns -1 if the fold is open or doesn't exist
  if vim.fn.foldclosed('.') ~= -1 then
    -- State: Fold is closed. Action: Open it fully/recursively (zO)
    vim.cmd('normal! zO')
  else
    -- State: Fold is open. Action: Close it (zc)
    -- Wrapped in pcall so Neovim doesn't throw an error on a line with no fold
    pcall(function() vim.cmd('normal! zc') end)
  end
end, { desc = 'Toggle current fold fully' })


-- Enable Treesitter folding for Python
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'lua',
    'python',
  },
  callback = function(args)
    -- Ensure the parser is running.
    pcall(vim.treesitter.start)

    -- Set the fold method and expression.
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- Get the Tree-sitter parser for the current buffer.
    local parser = vim.treesitter.get_parser(args.buf, 'python')
    if not parser then return end

    -- Register a one-time callback for when the syntax tree finishes building.
    local parsed_once = false
    parser:register_cbs({
      on_changedtree = function()
        if not parsed_once then
          parsed_once = true

          -- Move execution safely back to the main Neovim event loop.
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              vim.api.nvim_buf_call(args.buf, function()
                -- Run 'zx' to recalculate folds after the parser finishes.
                vim.cmd('normal! zx')
              end)
            end
          end)
        end
      end
    })
  end,
})


_G.custom_foldtext = function()
  -- Get the raw text of the first folded line
  local line = vim.fn.getline(vim.v.foldstart)

  -- Calculate the total number of lines in the fold
  local line_count = vim.v.foldend - vim.v.foldstart + 1

  -- Return the line with the count appended
  return string.format("%s ⋯ [%d lines]", line, line_count)
end
vim.opt.foldtext = 'v:lua.custom_foldtext()'
