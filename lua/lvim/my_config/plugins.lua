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
  -- {
  --   "git@github.com:ellisonleao/glow.nvim.git",
  --   branch = "main",
  --   ft = { "markdown" }
  --   -- run = "yay -S glow"
  -- },
  {
    "git@github.com:iamcco/markdown-preview.nvim.git",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      local root_dir = os.getenv("HOME")
      vim.g.mkdp_markdown_css = root_dir .. '/.local/share/lunarvim/lvim/markdown.css'
      -- lvim.keys.normal_mode['\\ll'] = [[<Plug>MarkdownPreview]]
      vim.cmd([[nmap \ll  <Plug>MarkdownPreview]])
    end,
  },
  { "git@github.com:dkarter/bullets.vim.git",
    ft = { "markdown", "text", "gitcommit", "scratch" }
  },
  {
    "git@github.com:tpope/vim-surround.git",
    -- keys = { "c", "d", "y" },
    config = function()
      vim.cmd([[autocmd FileType markdown let b:surround_100 = "<s><span>\r</span></s>"]])
    end
  },
  {
    "git@github.com:preservim/tagbar",
    config = function()
      vim.cmd([[nnoremap tb :TagbarOpenAutoClose<CR>]])
      vim.g.tagbar_sort = 0
    end
  },
  {
    "git@github.com:taoso/tagbar-markdown"
  }
}
