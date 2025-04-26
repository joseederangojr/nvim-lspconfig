local util = require 'lspconfig.util'

return {
  default_config = {
    cmd = { 'laravel-ls' },
    filetypes = { 'php', 'blade' },
    name = 'laravel_ls',
    root_dir = function(pattern)
      local cwd = vim.uv.cwd()
      local root = util.root_pattern('artisan')(pattern)
      return util.path.is_descendant(cwd, root) and cwd or root
    end,
  },
  docs = {
    description = [[
https://github.com/laravel-ls/laravel-ls

Laravel Language Server written in go.
]],
  },
}
