--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode = {
  ["<c-s>"] = ":w<cr>",
  ["<c-a>"] = ":q<cr>",
  ["<c-q>"] = ":q!<cr>",
  ["<a-,>"] = ":bp<cr>",
  ["<a-.>"] = ":bn<cr>",
  ["\\d"] = ":bd<cr>",
  ["0"] = "^"
}
lvim.keys.insert_mode = {
  ["<c-s>"] = "<esc>:w<cr>",
  ["<c-a>"] = "<esc>:q<cr>",
  ["<c-q>"] = "<esc>:q!<cr>",
  ["<c-l>"] = "<right>",
}
-- unmap a default keymapping
-- lvim.keys.normal_mode["<c-up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>"

-- change telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<c-j>"] = actions.move_selection_next,
--     ["<c-k>"] = actions.move_selection_previous,
--     ["<c-n>"] = actions.cycle_history_next,
--     ["<c-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<c-j>"] = actions.move_selection_next,
--     ["<c-k>"] = actions.move_selection_previous,
--   },
-- }

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
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!requires `:lvimcachereset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!requires `:lvimcachereset` to take effect!!
-- ---`:lviminfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- see <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  --   { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  --   {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/builtins.md#configuration
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
  {
    command = "latexindent",
    extra_args = { "-m" },
    ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
    filetypes = { "tex" },
  },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/builtins.md#configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- additional plugins
lvim.plugins = {
  { "git@github.com:lervag/vimtex.git",
    -- opt = true,
    config = function()
      vim.g.vimtex_view_general_viewer = 'qpdfview'
      -- vim.g.tex_comment_nospell = 1
      -- vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_view_general_options = [[--unique @pdf\#src:@tex:@line:@col]]
      -- vim.g.vimtex_quickfix_ignore_filters = [['Warning', 'warning', 'badness', 'Overfull']]
      vim.g.vimtex_quickfix_enabled = 0
      -- vim.g.vimtex_syntax_enabled = 1
      -- vim.g.vimtex_quickfix_autojump = 1
      -- vim.g.vimtex_quickfix_mode = 2
      -- vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
      -- vim.g.vimtex_quickfix_open_on_warning = 1
      -- vim.g.vimtex_compiler_latexmk = [[{ 'build_dir' : '',  'callback' : 1,  'continuous' : 1,  'executable' : 'latexmk',  'hooks' : [],  'options' : [    '-verbose',    '-synctex=1',    '-interaction=nonstopmode',  ], }]]
      -- vim.g.vimtex_quickfix_method = "pplattex"
    end,
    ft = 'tex'
  },
  {
    "git@github.com:ellisonleao/glow.nvim.git",
    branch = "main",
    ft = { "markdown" }
    -- run = "yay -S glow"
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- The vim script command should be write in [[]]
lvim.autocommands.custom_groups = {
  -- Return to last edit position when opening files (You want this!)
  { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
}
