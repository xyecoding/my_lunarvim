local dap_install = require "dap-install"
dap_install.config("python", {})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "autopep8",
    -- command = "black",
  },
}


-- require("null-ls").setup({
--   sources = {
--     require("null-ls").builtins.formatting.autopep8,
--   },
-- })
