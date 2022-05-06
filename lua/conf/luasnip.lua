local utils = require "lvim.utils"
local config_dir = get_config_dir()
-- local friendly_path = utils.join_paths(get_runtime_dir(), "site", "pack", "packer", "start", "friendly-snippets")
-- local snippets_vscode = { friendly_path, utils.join_paths(config_dir, "mylvim", "snippets", "vscode") }
local snippets_vscode = { utils.join_paths(config_dir, "mylvim", "snippets", "vscode") }
local snippets_lua = { utils.join_paths(config_dir, "mylvim", "snippets", "lua") }
local snippets_snipmate = { utils.join_paths(config_dir, "mylvim", "snippets", "snipmate") }
require("luasnip.loaders.from_lua").lazy_load({
  paths = snippets_lua,
})
require("luasnip.loaders.from_vscode").lazy_load({
  paths = snippets_vscode,
})
require("luasnip.loaders.from_snipmate").lazy_load({
  paths = snippets_snipmate,
})
