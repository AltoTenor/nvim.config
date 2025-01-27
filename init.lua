-- Set the runtime path for lazy.nvim
vim.g.mapleader = " "
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Load lazy.nvim
require("lazy").setup("plugins") -- Reference a 'plugins' module

-- Set options
vim.opt.number = true        -- Show line numbers
vim.opt.guifont = "FiraCode Nerd Font:h12" -- Font name and size
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.tabstop = 4          -- Number of spaces per tab
vim.opt.shiftwidth = 4       -- Spaces per autoindent
vim.opt.expandtab = true     -- Convert tabs to spaces
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Key mappings
vim.keymap.set('n', '<leader>w', ':w<CR>')  -- Save 
vim.keymap.set('n', '<leader>q', ':q<CR>')  -- Quit 
vim.keymap.set('n', '<leader>wq', ':wq<CR>')  -- Quit with Save
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Search Text in Files' })
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fgf', ':Telescope git_files<CR>', { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>fgs', ':Telescope git_status<CR>', { desc = 'Git Status' })

-- Load plugins (using a plugin manager like packer.nvim)
require('plugins')
