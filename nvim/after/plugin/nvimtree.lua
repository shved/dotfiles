require("nvim-tree").setup({
  view = {
    width = 45,
    side = "right",
    mappings = {
      list = {
        { key = "x", action = "close_node", action_cb = close_node},
        { key = "v", action = "vsplit", action_cb = vsplit },
        { key = "s", action = "split", action_cb = split },
        { key = "t", action = "tabnew", action_cb = tabnew },
        { key = "S", action = "" },
        { key = "I", action = "" },
        { key = "H", action = "" },
        { key = "B", action = "" },
        { key = "U", action = "" },
        { key = "i", action = "" },
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
