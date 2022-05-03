local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    extra_args = { "--no-bracket-spacing", "--print-width=80", "--prose-wrap=always", "--embedded-language-formatting=auto" },
    -- filetypes = { "markdown" },
  },
}
