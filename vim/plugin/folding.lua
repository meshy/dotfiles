vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Toggle folding with space (nnoremap <space> za)
vim.keymap.set('n', '<space>', 'za', { desc = 'Toggle fold under cursor' })

-- Enable Treesitter folding for Python
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
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
