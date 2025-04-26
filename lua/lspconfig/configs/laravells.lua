return {
  default_config = {
    cmd = { 'laravel-ls' },
    filetypes = { 'php', 'blade' },
    root_dir = function(fname)
      return vim.fs.dirname(vim.fs.find('artisan', { path = fname, upward = true })[1])
    end,
  },
  docs = {
    description = [[
https://github.com/laravel-ls/laravel-ls

Laravel Language Server written in go.
]],
  },
}
