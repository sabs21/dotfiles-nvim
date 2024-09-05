local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#5c1b02',
    green        = '#1c324d',
    blue         = '#5c3802',
    yellow       = '#fe8019',
    gray         = '#453725',
    darkgray     = '#383431',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
}

local theme = {
    normal = {
        a = {bg = colors.gray, fg = colors.white, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.white}
    },
    insert = {
        a = {bg = colors.blue, fg = colors.white, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray,  fg = colors.white}
    },
    visual = {
        a = {bg = colors.gray, fg = colors.white, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.white}
    },
    replace = {
        a = {bg = colors.red, fg = colors.white, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray,  fg = colors.white}
    },
    command = {
        a = {bg = colors.green, fg = colors.white, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.white}
    },
    inactive = {
        a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
        b = {bg = colors.darkgray, fg = colors.gray},
        c = {fg = colors.gray}
    }
}

return {{
   'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = theme,
            component_separators = '',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                { 'mode', separator = { right = ' ' }, padding = { left = 4, right = 1 } }
            },
            lualine_b = { 'filename', 'branch' },
            lualine_c = {
              '%=', --[[ add your center components here in place of this comment ]]
            },
            lualine_x = {},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
              { 'location', separator = { left = ' ' }, padding = { left = 1, right = 4 } },
            }
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' }
        },
        tabline = {},
        extensions = {}
    }
}}
