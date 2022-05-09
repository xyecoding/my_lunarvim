--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- vim.opt.shell = "/bin/sh"
vim.opt.rtp:append("~/.config/lvim/mylvim")
require('plugins')
require("null_ls")
require("debug")
require("lsp")
require("basic")
require("conf_plugins")
require("autocommand")
require("keymap")
vim.opt.rtp:append("~/.config/lvim/mylvim/after")
