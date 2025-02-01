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
  
  -- Markdown Preview 
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  -- autocompletion of code (IDK if i need it)
  -- {
  --     "hrsh7th/nvim-cmp",
  --     dependencies = {
  --       "hrsh7th/cmp-buffer", -- source for text in buffer
  --       "hrsh7th/cmp-path", -- source for file system paths
  --       "L3MON4D3/LuaSnip", -- snippet engine
  --       "saadparwaiz1/cmp_luasnip", -- for autocompletion
  --       "rafamadriz/friendly-snippets", -- useful snippets
  --       "hrsh7th/cmp-nvim-lsp", -- for LSP completion
  --     },
  --     config = function()
  --       local cmp = require("cmp")
  --       local luasnip = require("luasnip")
  --
  --       require("luasnip.loaders.from_vscode").lazy_load()
  --
  --       cmp.setup({
  --         snippet = {
  --           expand = function(args)
  --             luasnip.lsp_expand(args.body)
  --           end,
  --         },
  --         mapping = cmp.mapping.preset.insert({
  --           ["<C-k>"] = cmp.mapping.select_prev_item(),
  --           ["<C-j>"] = cmp.mapping.select_next_item(),
  --           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --           ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --           ["<C-Space>"] = cmp.mapping.complete(),
  --           ["<C-e>"] = cmp.mapping.abort(),
  --           ["<CR>"] = cmp.mapping.confirm({ select = false }),
  --         }),
  --         sources = cmp.config.sources({
  --           { name = "nvim_lsp" },
  --           { name = "luasnip" },
  --           { name = "buffer" },
  --           { name = "path" },
  --         }),
  --       })
  --     end,
  -- },
  -- Linter
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        svelte = { "eslint" },
        kotlin = { "ktlint" },
        terraform = { "tflint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
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
  -- Folding Plugin 
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }  -- Fold based on brackets & indentation
        end,
      })

      -- Keymaps for folding
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
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
  -- Plugin for indentation 
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

