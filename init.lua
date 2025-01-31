-- Set the runtime path for lazy.nvim
vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.opt.termguicolors = true

-- Key mappings
vim.keymap.set('n', '<leader>w', ':w<CR>')  -- Save 
vim.keymap.set('n', '<leader>q', ':q<CR>')  -- Quit 
vim.keymap.set('n', '<leader>qx', ':q!<CR>')  -- Quit and No Save 
vim.keymap.set('n', '<leader>wq', ':wq<CR>')  -- Quit with Save
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Search Text in Files' })
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fgf', ':Telescope git_files<CR>', { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>fgs', ':Telescope git_status<CR>', { desc = 'Git Status' })
vim.keymap.set('n', '<C-t>', ':NvimTreeOpen<CR>', { desc = 'Git Status' })
-- Keymaps for easier indentation
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Unindent selection' })
vim.keymap.set('x', '<leader>c', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment selection' })
vim.keymap.set('n', '<leader>c', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment line' })

-- Load plugins (using a plugin manager like packer.nvim)
require('plugins')

vim.cmd('colorscheme rose-pine')  -- This will set the colorscheme to rosepine
