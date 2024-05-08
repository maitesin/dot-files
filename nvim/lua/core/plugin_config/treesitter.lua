require('nvim-treesitter.configs').setup ({
  ensure_installed = {'vim', 'c', 'rust', 'python'},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})
