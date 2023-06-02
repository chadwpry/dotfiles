local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

local theme = {
  normal = {
    a = { fg = colors.orange, bg = colors.black },
    b = { fg = colors.black, bg = colors.orange },
    c = { fg = colors.green, bg = colors.black },
    z = { fg = colors.black, bg = colors.orange },
  },
  insert = {
    a = { fg = colors.black, bg = colors.light_green }
  },
  visual = {
    a = { fg = colors.black, bg = colors.orange }
  },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

require('lualine').setup({
  options = {
    component_separators = '|',
    globalstatus = false,
    icons_enabled = true,
    refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
      statusline = 1000,         -- The refresh option sets minimum time that lualine tries
      tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
      winbar = 1000,
    },
    section_separators = '',
    theme = theme,
  },
  sections = {
    lualine_a = {
      {'filename', newfile_status = true, path  = 3, shorting_target = 40},
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      '%=', '%t%m', '%3p',
    },
    lualine_x = {
      'encoding',
      {'filetype', colored = true, icon = {align = 'right'}},
      {'fileformat'},
    },
    lualine_y = {'progress'},
    lualine_z = {'location', 'mode'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
})
