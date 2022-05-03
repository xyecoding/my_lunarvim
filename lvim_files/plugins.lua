local core_plugins = {
  -- Packer can manage itself as an optional plugin
  { "git@github.com:wbthomason/packer.nvim" },
  { "git@github.com:neovim/nvim-lspconfig" },
  { "git@github.com:tamago324/nlsp-settings.nvim" },
  {
    "git@github.com:jose-elias-alvarez/null-ls.nvim",
  },
  { "git@github.com:antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "git@github.com:williamboman/nvim-lsp-installer",
  },
  {
    "git@github.com:lunarvim/onedarker.nvim",
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
    "git@github.com:rcarriga/nvim-notify",

    config = function()
      require("lvim.core.notify").setup()
    end,
    requires = { "git@github.com:nvim-telescope/telescope.nvim" },
    disable = not lvim.builtin.notify.active or not lvim.builtin.telescope.active,
  },
  { "git@github.com:Tastyep/structlog.nvim" },

  { "git@github.com:nvim-lua/popup.nvim" },
  { "git@github.com:nvim-lua/plenary.nvim" },
  -- Telescope
  {
    "git@github.com:nvim-telescope/telescope.nvim",

    config = function()
      require("lvim.core.telescope").setup()
    end,
    disable = not lvim.builtin.telescope.active,
  },
  {
    "git@github.com:nvim-telescope/telescope-fzf-native.nvim",
    requires = { "git@github.com:nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not lvim.builtin.telescope.active,
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "git@github.com:hrsh7th/nvim-cmp",
    config = function()
      if lvim.builtin.cmp then
        require("lvim.core.cmp").setup()
      end
    end,
    -- requires = {
    --   "git@github.com:L3MON4D3/LuaSnip",
    --   -- "rafamadriz/friendly-snippets",
    -- },
  },
  {
    "git@github.com:rafamadriz/friendly-snippets",
  },
  -- {
  --   "git@github.com:L3MON4D3/LuaSnip",
  --   config = function()
  --     -- local utils = require "lvim.utils"
  --     -- local paths = {
  --     --   utils.join_paths(get_runtime_dir(), "site", "pack", "packer", "start", "friendly-snippets"),
  --     -- }
  --     -- local user_snippets = utils.join_paths(get_config_dir(), "snippets")
  --     -- if utils.is_directory(user_snippets) then
  --     --   paths[#paths + 1] = user_snippets
  --     -- end
  --     require("luasnip.loaders.from_lua").lazy_load({
  --       path = { "~/.local/share/lunarvim/lvim/lua/lvim/my_config/snippets/lua" },
  --     })
  --     require("luasnip.loaders.from_vscode").lazy_load({
  --       path = { "~/.local/share/lunarvim/lvim/lua/lvim/my_config/snippets/vscode" },
  --     })
  --     require("luasnip.loaders.from_snipmate").lazy_load({
  --       path = { "~/.local/share/lunarvim/lvim/lua/lvim/my_config/snippets/snipmate" },
  --     })
  --   end,
  -- },
  {
    "git@github.com:hrsh7th/cmp-nvim-lsp",
  },
  {
    "git@github.com:saadparwaiz1/cmp_luasnip",
  },
  {
    "git@github.com:hrsh7th/cmp-buffer",
  },
  {
    "git@github.com:hrsh7th/cmp-path",
  },
  {
    -- NOTE: Temporary fix till folke comes back
    "git@github.com:max397574/lua-dev.nvim",
    module = "lua-dev",
  },

  -- Autopairs
  {
    "git@github.com:windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = function()
      require("lvim.core.autopairs").setup()
    end,
    disable = not lvim.builtin.autopairs.active,
  },

  -- Treesitter
  {
    "git@github.com:nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      require("lvim.core.treesitter").setup()
    end,
  },
  {
    "git@github.com:JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },

  -- NvimTree
  {
    "git@github.com:kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("lvim.core.nvimtree").setup()
    end,
    disable = not lvim.builtin.nvimtree.active,
  },

  {
    "git@github.com:lewis6991/gitsigns.nvim",

    config = function()
      require("lvim.core.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not lvim.builtin.gitsigns.active,
  },

  -- Whichkey
  {
    "git@github.com:folke/which-key.nvim",
    config = function()
      require("lvim.core.which-key").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.which_key.active,
  },

  -- Comments
  {
    "git@github.com:numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("lvim.core.comment").setup()
    end,
    disable = not lvim.builtin.comment.active,
  },

  -- project.nvim
  {
    "git@github.com:ahmedkhalf/project.nvim",
    config = function()
      require("lvim.core.project").setup()
    end,
    disable = not lvim.builtin.project.active,
  },

  -- Icons
  {
    "git@github.com:kyazdani42/nvim-web-devicons",
    disable = not lvim.use_icons,
  },

  -- Status Line and Bufferline
  {
    -- "hoob3rt/lualine.nvim",
    "git@github.com:nvim-lualine/lualine.nvim",
    -- "Lunarvim/lualine.nvim",
    config = function()
      require("lvim.core.lualine").setup()
    end,
    disable = not lvim.builtin.lualine.active,
  },

  {
    "git@github.com:akinsho/bufferline.nvim",
    config = function()
      require("lvim.core.bufferline").setup()
    end,
    branch = "main",
    event = "BufWinEnter",
    disable = not lvim.builtin.bufferline.active,
  },

  -- Debugging
  {
    "git@github.com:mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("lvim.core.dap").setup()
    end,
    disable = not lvim.builtin.dap.active,
  },

  -- Debugger management
  {
    "git@github.com:Pocco81/DAPInstall.nvim",
    -- event = "BufWinEnter",
    -- event = "BufRead",
    disable = not lvim.builtin.dap.active,
  },

  -- alpha
  {
    "git@github.com:goolord/alpha-nvim",
    config = function()
      require("lvim.core.alpha").setup()
    end,
    disable = not lvim.builtin.alpha.active,
  },

  -- Terminal
  {
    "git@github.com:akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("lvim.core.terminal").setup()
    end,
    disable = not lvim.builtin.terminal.active,
  },

  -- SchemaStore
  {
    "git@github.com:b0o/schemastore.nvim",
  },
}

for _, entry in ipairs(core_plugins) do
  if not os.getenv "LVIM_DEV_MODE" then
    entry["lock"] = true
  end
end

return core_plugins
