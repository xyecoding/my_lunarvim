-------------------------------------debug settings--------------------------------------

--------------lspconfig----------------------------------
-- ~/.cache/nvim/lsp.log run :lua vim.cmd('e'..vim.lsp.get_log_path()) to open it
vim.lsp.set_log_level("debug")


------------------------null-ls----------------------------------
-- output the log file in ~/.cache/nvim/null-ls.log
-- require("null-ls").setup({
--   debug = true
-- })
