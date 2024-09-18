return {
  {
    "jwalton512/vim-blade",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "vue",
            "blade",
            "svelte",
          },
        },
      },
    },
  },
}
