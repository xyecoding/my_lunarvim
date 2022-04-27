local core_plugins = {
  -- Packer can manage itself as an optional plugin
  { "git@github.com:wbthomason/packer.nvim.git" },
  -- This plugin allows for declaratively configuring, lanching, and
  -- initializing language servers you have installed.
  -- The confiugre file is located in ./lsp/config.lua
  { "git@github.com:neovim/nvim-lspconfig.git" },
  -- enable confiugre neovim LSP using json/yaml files
  -- ~/.config/lvim/lsp-settings is the config directory, it is not created now
  { "git@github.com:tamago324/nlsp-settings.nvim.git" },
  {
    "git@github.com:jose-elias-alvarez/null-ls.nvim.git",
  },
  -- define the wait time of cursor hold
  { "git@github.com:antoinemadec/FixCursorHold.nvim.git" },
  -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    -- auto install LSP servers locally (inside :echo stdpath("data") )
    -- ~/.local/share/nvim/lsp_servers
    -- it requires nvim-lspconfig
    "git@github.com:williamboman/nvim-lsp-installer.git",
  },
  {
    "git@github.com:lunarvim/onedarker.nvim.git",
    config = function()
      pcall(function()
        if lvim and lvim.colorscheme == "onedarker" then
          require("onedarker").setup()
          lvim.builtin.lualine.options.theme = "onedarker"
        end
      end)
    end,
    disable = lvim.colorscheme ~= "onedarker",
  },
  {
    "git@github.com:rcarriga/nvim-notify.git",

    config = function()
      require("lvim.core.notify").setup()
    end,
    requires = { "git@github.com:nvim-telescope/telescope.nvim.git" },
    disable = not lvim.builtin.notify.active or not lvim.builtin.telescope.active,
  },
  { "git@github.com:Tastyep/structlog.nvim.git" },

  { "git@github.com:nvim-lua/popup.nvim.git" },
  { "git@github.com:nvim-lua/plenary.nvim.git" },
  -- Telescope
  {
    "git@github.com:nvim-telescope/telescope.nvim.git",

    config = function()
      require("lvim.core.telescope").setup()
    end,
    disable = not lvim.builtin.telescope.active,
  },
  {
    "git@github.com:nvim-telescope/telescope-fzf-native.nvim.git",
    requires = { "git@github.com:nvim-telescope/telescope.nvim.git" },
    run = "make",
    disable = not lvim.builtin.telescope.active,
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "git@github.com:hrsh7th/nvim-cmp.git",
    config = function()
      if lvim.builtin.cmp then
        require("lvim.core.cmp").setup()
      end
    end,
    -- requires = {
    --   -- "git@github.com:L3MON4D3/LuaSnip.git",
    --   "git@github.com:rafamadriz/friendly-snippets",
    -- },
  },
  -- {
  --   "git@github.com:rafamadriz/friendly-snippets",
  -- },

  -- {
  --   "git@github.com:molleweide/LuaSnip-snippets.nvim",
  -- },
  {
    "git@github.com:L3MON4D3/LuaSnip.git",
    config = function()
      -- local utils = require "lvim.utils"
      -- local luasnip = require("luasnip")
      -- luasnip.snippets = require("luasnip_snippets").load_snippets()
      -- require("luasnip_snippets").load_snippets()

      require("luasnip.loaders.from_lua").lazy_load({
        paths = {
          "~/.local/share/lunarvim/lvim/snippets/lua"
        },
      })
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {
          "~/.local/share/lunarvim/lvim/snippets/vscode"
        },
      })
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = {
          "~/.local/share/lunarvim/lvim/snippets/snipmate"
        },
      })
    end,
  },
  {
    "git@github.com:hrsh7th/cmp-nvim-lsp.git",
  },
  {
    "git@github.com:saadparwaiz1/cmp_luasnip.git",
  },
  {
    "git@github.com:hrsh7th/cmp-buffer.git",
  },
  {
    "git@github.com:hrsh7th/cmp-path.git",
  },
  {
    "git@github.com:folke/lua-dev.nvim.git",
    module = "lua-dev",
  },

  -- Autopairs
  {
    "git@github.com:windwp/nvim-autopairs.git",
    -- event = "InsertEnter",
    config = function()
      require("lvim.core.autopairs").setup()
    end,
    disable = not lvim.builtin.autopairs.active,
  },

  -- Treesitter
  {
    "git@github.com:nvim-treesitter/nvim-treesitter.git",
    branch = vim.fn.has "nvim-0.6" == 1 and "master" or "0.5-compat",
    -- run = ":TSUpdate",
    config = function()
      require("lvim.core.treesitter").setup()
    end,
  },
  {
    "git@github.com:JoosepAlviste/nvim-ts-context-commentstring.git",
    event = "BufReadPost",
  },

  -- NvimTree
  {
    "git@github.com:kyazdani42/nvim-tree.lua.git",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("lvim.core.nvimtree").setup()
    end,
    disable = not lvim.builtin.nvimtree.active,
  },

  {
    "git@github.com:lewis6991/gitsigns.nvim.git",

    config = function()
      require("lvim.core.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not lvim.builtin.gitsigns.active,
  },

  -- Whichkey
  {
    "git@github.com:folke/which-key.nvim.git",
    config = function()
      require("lvim.core.which-key").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.which_key.active,
  },

  -- Comments
  {
    "git@github.com:numToStr/Comment.nvim.git",
    tag = 'v0.6',
    event = "BufRead",
    config = function()
      require("lvim.core.comment").setup()
    end,
    disable = not lvim.builtin.comment.active,
  },

  -- project.nvim
  {
    "git@github.com:ahmedkhalf/project.nvim.git",
    config = function()
      require("lvim.core.project").setup()
    end,
    disable = not lvim.builtin.project.active,
  },

  -- Icons
  { "git@github.com:kyazdani42/nvim-web-devicons.git" },

  -- Status Line and Bufferline
  {
    -- "hoob3rt/lualine.nvim",
    "git@github.com:nvim-lualine/lualine.nvim.git",
    -- "Lunarvim/lualine.nvim",
    config = function()
      require("lvim.core.lualine").setup()
    end,
    disable = not lvim.builtin.lualine.active,
  },

  {
    "git@github.com:akinsho/bufferline.nvim.git",
    config = function()
      require("lvim.core.bufferline").setup()
    end,
    branch = "main",
    event = "BufWinEnter",
    disable = not lvim.builtin.bufferline.active,
  },

  -- Debugging
  {
    "git@github.com:mfussenegger/nvim-dap.git",
    -- event = "BufWinEnter",
    config = function()
      require("lvim.core.dap").setup()
    end,
    disable = not lvim.builtin.dap.active,
  },

  -- Debugger management
  {
    "git@github.com:Pocco81/DAPInstall.nvim.git",
    -- event = "BufWinEnter",
    -- event = "BufRead",
    disable = not lvim.builtin.dap.active,
  },

  -- alpha
  {
    "git@github.com:goolord/alpha-nvim.git",
    config = function()
      require("lvim.core.alpha").setup()
    end,
    disable = not lvim.builtin.alpha.active,
  },

  -- Terminal
  {
    "git@github.com:akinsho/toggleterm.nvim.git",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("lvim.core.terminal").setup()
    end,
    disable = not lvim.builtin.terminal.active,
  },

  -- SchemaStore
  {
    "git@github.com:b0o/schemastore.nvim.git",
  },
}

for _, entry in ipairs(core_plugins) do
  if not os.getenv "LVIM_DEV_MODE" then
    entry["lock"] = true
  end
end

return core_plugins
