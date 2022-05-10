lvim.plugins = {
  { 'bennypowers/nvim-regexplainer',
    config = function()
      require("conf.nvim-regexplainer").setup()
    end,
    -- config = function() require 'regexplainer'.setup() end,
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'MunifTanjim/nui.nvim',
    } },
  {
    "lukas-reineke/indent-blankline.nvim", -- indent blankline
    config = function()
      require("conf.indent-blankline").setup()
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  -- },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "Shatur/neovim-session-manager",
    config = function()
      require("conf.neovim-session-manager").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("conf.dap-virtual-text").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("conf.dap-ui").setup()
    end,
  },
  {
    "voldikss/vim-translator",
    event = "CursorMoved",
    config = function()
      vim.cmd [[
    let g:translator_target_lang = 'zh'
    let g:translator_default_engines = ['youdao', 'bing']
    nmap <silent> \t <Plug>TranslateW
]]
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("conf.fidget").setup()
    end,
  },
  -- {
  --   "nvim-pack/nvim-spectre",
  --   event = "BufRead",
  --   config = function()
  --     require("spectre").setup()
  --   end,
  --   -- config = function()
  --   --   require("conf.nvim-spectre").setup()
  --   -- end,
  -- },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("conf.treesitter-context").setup()
    end,
  },
  -- {
  --   "lewis6991/impatient.nvim",
  --   config = function()
  --     require("conf.impatient").setup()
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- {
  --   "ggandor/lightspeed.nvim",
  --   event = "BufRead",
  -- },
  {
    "norcalli/nvim-colorizer.lua",
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
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("conf.todo-comments").setup()
    end,
  },
  { "tpope/vim-repeat" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("conf.aerial").setup()
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.cmd(
      [[
      let g:undotree_WindowLayout = 2
      nnoremap <leader>ut :UndotreeToggle<CR><C-w>w<C-w>w
]]
      )
    end
  },
  { "lervag/vimtex",
    -- opt = true,
    config = function()
      vim.g.vimtex_view_general_viewer = 'qpdfview'
      -- vim.g.tex_comment_nospell = 1
      -- vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_view_general_options = [[--unique @pdf\#src:@tex:@line:@col]]
      -- vim.g.vimtex_quickfix_ignore_filters = [['Warning', 'warning', 'badness', 'Overfull']]
      vim.g.vimtex_quickfix_enabled = 0
      vim.g.vimtex_syntax_enabled = 1
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
  --   "ellisonleao/glow.nvim.git",
  --   branch = "main",
  --   ft = { "markdown" }
  --   -- run = "yay -S glow"
  -- },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      local root_dir = os.getenv("HOME")
      vim.g.mkdp_markdown_css = root_dir .. '/.local/share/lunarvim/lvim/lua/lvim/my_config/markdown.css'
      vim.g.mkdp_auto_close = 0
      -- lvim.keys.normal_mode['\\ll'] = [[<Plug>MarkdownPreview]]
      -- vim.cmd([[nmap \ll  <Plug>MarkdownPreview]])
      -- lvim.keys.normal_mode["\\ll"] = "<Plug>MarkdownPreview"
      vim.api.nvim_set_keymap('n', '\\ll', '<Plug>MarkdownPreview', { noremap = true, silent = true })
    end,
  },
  { "dkarter/bullets.vim",
    ft = { "markdown", "text", "gitcommit", "scratch" }
  },
  -- {
  --   "tpope/vim-surround",
  --   -- keys = { "c", "d", "y" },
  --   config = function()
  --     vim.cmd([[autocmd FileType markdown let b:surround_100 = "<s><span>\r</span></s>"]])
  --   end
  -- },
  -- {
  --   "preservim/tagbar",
  --   config = function()
  --     vim.cmd([[nnoremap tb :TagbarOpenAutoClose<CR>]])
  --     vim.g.tagbar_sort = 0
  --   end
  -- },
  -- {
  --   "taoso/tagbar-markdown",
  --   ft = "markdown"
  -- }
}
