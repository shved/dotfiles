vim.o.showtabline = 2

local acid = '#DFFF00'
local darkgrey = '#464347'
local grey = '#444444'
local lightgrey = '#808080'
local almostblack = '#202020'
local blue = '#3388FF'
local red = '#FF3322'
local yellow = '#FF3322'
local lime = '#AFD700'
local orange = '#FEA100'
local greeny = '#78BD9E'

local theme = {
    fill = { bg = grey, fg = lightgrey }, -- tabline background
    head = { bg = grey, fg = acid }, -- head element highlight
    current_tab = { bg = acid, fg = grey }, -- current tab label highlight
    tab = { bg = lightgrey, fg = grey }, -- other tab label highlight
    win = { bg = grey, fg = grey }, -- window highlight
    tail = { bg = lightgrey, fg = grey }, -- tail element highlight
}

require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep(' ', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.number(),
        tab.name(),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep('', theme.tail, theme.fill),
      { ' ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
