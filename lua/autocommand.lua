vim.cmd [[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]]
-- The vim script command should be write in [[]]
-- lvim.autocommands.custom_groups = {
--   -- Return to last edit position when opening files (You want this!)
--   { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
--   -- { "BufWinLeave", "*", "silent mkview" },
--   -- { "BufWinEnter", "*", "loadview" },
-- }
