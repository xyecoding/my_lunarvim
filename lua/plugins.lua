lvim.plugins = {
  {
    "git@github.com:j-hui/fidget.nvim",
    config = function()
      require("conf.fidget").setup()
    end,
  },
  {
    "git@github.com:nvim-pack/nvim-spectre",
    config = function()
      require("conf.nvim-spectre").setup()
    end,
  },
  {
    "git@github.com:andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "git@github.com:romgrk/nvim-treesitter-context",
    config = function()
      require("conf.treesitter-context").setup()
    end,
  },
  {
    "git@github.com:lewis6991/impatient.nvim",
    config = function()
      require("conf.impatient").setup()
    end,
  },
  {
    "git@github.com:folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "git@github.com:phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- {
  --   "git@github.com:ggandor/lightspeed.nvim",
  --   event = "BufRead",
  -- },
  {
    "git@github.com:norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true,
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- lowercase = true,
      })
    end,
  },
  {
    "git@github.com:folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { "git@github.com:tpope/vim-repeat" },
  {
    "git@github.com:ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "git@github.com:stevearc/aerial.nvim",
    config = function()
      require("conf.aerial").setup()
    end,
  },
  {
    "git@github.com:mbbill/undotree",
    config = function()
      vim.cmd(
      [[
      let g:undotree_WindowLayout = 2
      nnoremap <leader>ut :UndotreeToggle<CR><C-w>w<C-w>w
]]
      )
    end
  },
  {
    "git@github.com:L3MON4D3/LuaSnip",
    config = function()
      local utils = require "lvim.utils"
      local config_dir = get_config_dir()
      local friendly_path = utils.join_paths(get_runtime_dir(), "site", "pack", "packer", "start", "friendly-snippets")
      local snippets_vscode = { friendly_path, utils.join_paths(config_dir, "mylvim", "snippets", "vscode") }
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
    end,
  },
  { "git@github.com:lervag/vimtex",
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
  -- {
  --   "git@github.com:ellisonleao/glow.nvim.git",
  --   branch = "main",
  --   ft = { "markdown" }
  --   -- run = "yay -S glow"
  -- },
  {
    "git@github.com:iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      local root_dir = os.getenv("HOME")
      vim.g.mkdp_markdown_css = root_dir .. '/.local/share/lunarvim/lvim/lua/lvim/my_config/markdown.css'
      -- lvim.keys.normal_mode['\\ll'] = [[<Plug>MarkdownPreview]]
      vim.cmd([[nmap \ll  <Plug>MarkdownPreview]])
    end,
  },
  { "git@github.com:dkarter/bullets.vim",
    ft = { "markdown", "text", "gitcommit", "scratch" }
  },
  {
    "git@github.com:tpope/vim-surround",
    -- keys = { "c", "d", "y" },
    config = function()
      vim.cmd([[autocmd FileType markdown let b:surround_100 = "<s><span>\r</span></s>"]])
    end
  },
  -- {
  --   "git@github.com:preservim/tagbar",
  --   config = function()
  --     vim.cmd([[nnoremap tb :TagbarOpenAutoClose<CR>]])
  --     vim.g.tagbar_sort = 0
  --   end
  -- },
  -- {
  --   "git@github.com:taoso/tagbar-markdown",
  --   ft = "markdown"
  -- }
}
