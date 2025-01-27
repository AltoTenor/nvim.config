return {
  -- Lazy.nvim itself (optional, for managing updates)
  { "folke/lazy.nvim" },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Run this command after installation
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "javascript" }, -- Specify languages
        highlight = { enable = true },
      }
    end,
  },

  -- Telescope for fuzzy searching
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-j>"] = require("telescope.actions").move_selection_next,
            },
          },
        },
      }
    end,
  },
  -- ToggleTerm for Terminal
    {
        "akinsho/toggleterm.nvim",  -- Plugin name and repository
        config = function()         -- Configuring the plugin using a Lua function
        require("toggleterm").setup{  -- Calling the setup function to configure the plugin
            size = 20,  -- Set the default terminal size (in lines)
            open_mapping = [[<c-t>]],  -- Keybinding to open the terminal (Ctrl + \)
            direction = "horizontal",  -- Open the terminal in a floating window
        }
        end,
    },

  -- Lualine for a status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = { theme = "gruvbox" },
      }
    end,
  },

  -- Gruvbox color scheme
  { "morhetz/gruvbox" },

  -- Auto pairs for brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
}

