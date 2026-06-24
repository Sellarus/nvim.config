local plugins = {
  'https://github.com/nvim-lualine/lualine.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  -- 👇 The new Tabline configuration 👇
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 0, -- Shows just the filename. Use 2 to show filename + buffer index
        max_length = vim.o.columns * 2 / 3, -- Stop at 2/3 screen width
        symbols = {
          modified = ' ●', -- Indicator for unsaved changes
          alternate_file = '',
          directory = '',
        },
        -- Optional: Rename some generic buffers for a cleaner look
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}, --Removed 'tabs' so the right side stays clean
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
