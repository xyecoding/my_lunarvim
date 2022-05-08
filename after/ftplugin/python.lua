local dap_install = require "dap-install"
dap_install.config("python", {})
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "autopep8",
  },
}
