-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--       vim.cmd "quit"
--     end
--   end
-- })

require("nvim-tree").setup({
  view = {
    -- width = 45,
    -- side = "right",
    float = {
      enable = true,
      open_win_config = {
        relative = "cursor",
        border = "shadow",
      },
    },
    mappings = {
      list = {
        { key = "x", action = "close_node", action_cb = close_node},
        { key = "v", action = "vsplit", action_cb = vsplit },
        { key = "i", action = "split", action_cb = split },
        { key = "t", action = "tabnew", action_cb = tabnew },
        { key = "S", action = "" },
        { key = "I", action = "" },
        { key = "H", action = "" },
        { key = "B", action = "" },
        { key = "U", action = "" },
      },
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        -- git = false,
      },
    },
    special_files = {},
  },
})

