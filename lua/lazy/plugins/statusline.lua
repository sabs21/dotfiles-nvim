local c = {
    primary          = '#ebdbb2',
    secondary        = '#4d483c',
    tertiary         = '#383431',
    inactive         = '#7c6f64',
    normal_bright    = '#db8e2a',
    normal_dark      = '#453725',
    insert_bright    = '#db8e2a',
    insert_dark      = '#453725',
    visual_bright    = '#1fc4de',
    visual_dark      = '#1a383d',
    replace_bright   = '#de0707',
    replace_dark     = '#381919',
    command_bright   = '#5765ff',
    command_dark     = '#303247'
}

local theme = {
    normal = {
        a = {bg = c.primary, gui = 'bold'},
        b = {bg = c.secondary, fg = c.primary},
        c = {bg = c.tertiary, fg = c.primary},
        y = {bg = c.secondary, fg = c.primary},
        z = {bg = c.secondary, fg = c.primary}
    },
    insert = {
        a = {bg = c.insert_bright, gui = 'bold'},
        b = {bg = c.insert_dark, fg = c.insert_bright},
        c = {bg = c.tertiary, fg = c.primary},
        y = {bg = c.secondary, fg = c.primary},
        z = {bg = c.secondary, fg = c.primary}
    },
    visual = {
        a = {bg = c.visual_bright, gui = 'bold'},
        b = {bg = c.visual_dark, fg = c.visual_bright},
        c = {bg = c.tertiary, fg = c.primary},
        y = {bg = c.secondary, fg = c.primary},
        z = {bg = c.secondary, fg = c.primary}
    },
    replace = {
        a = {bg = c.replace_bright, gui = 'bold'},
        b = {bg = c.replace_dark, fg = c.replace_bright},
        c = {bg = c.tertiary, fg = c.primary},
        y = {bg = c.secondary, fg = c.primary},
        z = {bg = c.secondary, fg = c.primary}
    },
    command = {
        a = {bg = c.command_bright, gui = 'bold'},
        b = {bg = c.command_dark, fg = c.command_bright},
        c = {bg = c.tertiary, fg = c.primary},
        y = {bg = c.secondary, fg = c.primary},
        z = {bg = c.secondary, fg = c.primary}
    },
    inactive = {
        a = {fg = c.inactive},
        b = {},
        c = {}
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
                {
                    '%w',
                    padding = 2
                }
            },
            lualine_b = {
                {
                    'mode',
                    padding = 2
                }
            },
            lualine_c = {
                'filename',
                'branch'
            },
            lualine_x = {
              '%=', --[[ add your center components here in place of this comment ]]
            },
            lualine_y = {
                {
                    'filetype',
                    padding = 2
                },
                {
                    'progress',
                    padding = 2
                }
            },
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
