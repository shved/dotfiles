require('lualine').setup {
  options = {
    -- theme = "horizon",
    -- theme = "papercolor_dark",
    theme = "powerline_dark",
    -- theme = "nightfly",
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 3,
        shorting_target = 40,
      }
    }
  }
}
