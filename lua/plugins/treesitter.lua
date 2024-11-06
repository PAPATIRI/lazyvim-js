-- add more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        custom_calculation = function(_, language_tree)
          if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" and language_tree._lang ~= "php" then
            return "{{-- %s --}}"
          end
        end,
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      -- Web development
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "vue",
      "svelte",

      -- Backend
      "php",
      "go",

      -- Frameworks and libraries
      "regex",
      "jsdoc",

      -- Templating
      "blade",

      -- Configuration
      "yaml",
      "toml",

      -- Scripting
      "lua",
      "vim",
      "bash",

      -- Documentation
      "markdown",
      "markdown_inline",

      -- Query language (for treesitter itself)
      "query",
    },
    auto_install = true, -- Set to false to prevent automatic installation of new parsers
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {
          "src/parser.c",
          -- 'src/scanner.cc',
        },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
      },
      filetype = "blade",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
}
