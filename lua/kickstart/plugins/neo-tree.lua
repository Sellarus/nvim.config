-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  filesystem = {
    window = {
      position = 'left',
      width = 26,
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

-- auto open when terminal is wide enough
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Always open Neo-tree on startup if terminal is wide enough',
  callback = function()
    local min_width = 120 -- Set your desired minimum terminal width here

    if vim.o.columns >= min_width then
      -- vim.schedule ensures Neovim finishes rendering the UI first
      vim.schedule(function() vim.cmd 'Neotree show' end)
    end
  end,
})

-- set as unlisted buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.bo.buflisted = false
  end,
})
