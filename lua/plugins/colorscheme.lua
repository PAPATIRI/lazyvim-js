return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- Disable italic for comments and other elements
        italic = false,
        -- Override specific highlight groups
        override = {
          MiniIndentscopeSymbol = {
            fg = "#4C566A", -- Adjust color as needed
            italic = false,
          },
          EndOfBuffer = { fg = "bg" },
        },
      })
      vim.cmd.colorscheme("nordic")

      -- Ensure MiniIndentscopeSymbol is not italic after colorscheme is applied
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "nordic",
        callback = function()
          vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#4C566A", italic = false })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg })
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
