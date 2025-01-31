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
        indent = true,
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
  -- Commenting -- 
  {
    'numToStr/Comment.nvim',
    opts = {
      pre_hook = function(ctx) -- Optional context-aware hook
        if vim.bo.filetype == 'typescriptreact' then
          return require('ts_context_commentstring.internal').calculate_commentstring()
        end
   end
    },
    lazy = false
  },
  -- Tree Directory Plugin -- 
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'NMAC427/guess-indent.nvim',
    opts = {
      override_editorconfig = false,
      filetype_exclude = { 'netrw', 'tutor' }
    }
  },

  -- Lualine for a status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = { theme = "tokyodark" },
      }
    end,
  },

  -- color scheme
  {
    "tiagovla/tokyodark.nvim",
    -- opts = {
        -- custom options here
    -- },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  { 'rose-pine/neovim', 
    config = function()
        require("rose-pine").setup {
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },
        }
    end,
  },

  -- Auto pairs for brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
}

