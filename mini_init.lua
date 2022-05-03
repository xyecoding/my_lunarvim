vim.opt["foldmethod"] = "syntax"
vim.opt["foldenable"] = false
vim.opt["foldlevel"] = 99
-- vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()"
vim.opt["relativenumber"] = true
vim.cmd(
[[
  au BufWinLeave * silent mkview
  au BufWinEnter * silent loadview
  ]]
)
