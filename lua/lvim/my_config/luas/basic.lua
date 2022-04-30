-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- local luasnip = require("luasnip")
lvim.keys.insert_mode["<c-l>"] = "<right>"
lvim.keys.normal_mode["0"] = "^"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<c-up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>"

vim.opt["relativenumber"] = true
vim.opt["spell"] = true
vim.opt["cmdheight"] = 1
vim.opt["clipboard"] = "unnamed"
vim.opt["wrap"] = true
-- vim.opt["swapfile"] = true
-- vim.opt.swapfile = true



-- change telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
    ["<c-n>"] = actions.cycle_history_next,
    ["<c-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
  },
}



-- use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["p"] = { "<cmd>telescope projects<cr>", "projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+trouble",
--   r = { "<cmd>trouble lsp_references<cr>", "references" },
--   f = { "<cmd>trouble lsp_definitions<cr>", "definitions" },
--   d = { "<cmd>trouble document_diagnostics<cr>", "diagnostics" },
--   q = { "<cmd>trouble quickfix<cr>", "quickfix" },
--   l = { "<cmd>trouble loclist<cr>", "locationlist" },
--   w = { "<cmd>trouble workspace_diagnostics<cr>", "wordspace diagnostics" },
-- }

-- todo: user config for predefined plugins
-- after changing plugin config exit and reopen lunarvim, run :packerinstall :packercompile
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.cmp.completion.keyword_length = 2
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "markdown",
  "css",
  "rust",
  "java",
  "latex",
  "bibtex",
  "yaml",
  "fish"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic lsp settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- The vim script command should be write in [[]]
lvim.autocommands.custom_groups = {
  -- Return to last edit position when opening files (You want this!)
  { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
  -- { "BufReadPost", "*.md", [[let b:surround_100 = "<s><span>\r</span></s>"]] },
}
