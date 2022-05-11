-- local _, actions = pcall(require, "telescope.actions")
lvim.keys.insert_mode["<c-l>"] = "<right>"
lvim.keys.normal_mode["0"] = "^"
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["kj"] = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<c-up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>"
-- lvim.builtin.telescope.defaults.mappings = {
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



-- lvim.builtin.which_key.mappings["w"] = { "<cmd>w<CR>", "Save" }
-- lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
-- lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Quit!" }
lvim.builtin.which_key.mappings["so"] = { "<cmd>TodoTelescope<cr>", "TODO" }
lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" }
lvim.builtin.which_key.mappings.s["p"] = { "<CMD>Telescope projects<CR>", "Project" }

-- lvim.builtin.which_key.mappings["p"] = { "<cmd>telescope projects<cr>", "projects" }

lvim.builtin.which_key.mappings["ss"] = {
  name = "+sessions",
  l = { "<cmd>SessionManager load_session<cr>", "Load Session" },
  d = { "<cmd>SessionManager delete_session<cr>", "Delete Session" }
}

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+trouble",
--   r = { "<cmd>trouble lsp_references<cr>", "references" },
--   f = { "<cmd>trouble lsp_definitions<cr>", "definitions" },
--   d = { "<cmd>trouble document_diagnostics<cr>", "diagnostics" },
--   q = { "<cmd>trouble quickfix<cr>", "quickfix" },
--   l = { "<cmd>trouble loclist<cr>", "locationlist" },
--   w = { "<cmd>trouble workspace_diagnostics<cr>", "wordspace diagnostics" },
--   o = { "<cmd>TodoTrouble<cr>", "TODO" }
-- }
