---@brief
---
--- https://github.com/laravel-ls/laravel-ls
--- Laravel Language Server written in go.
---
--- `laravel-ls` can be installed via `go install`:
--- ```sh
--- go install github.com/laravel-ls/laravel-ls/cmd/laravel-ls@latest
--- ```

local util = require 'lspconfig.util'

return {
  cmd = { 'laravel-ls' },
  filetypes = { 'php', 'blade' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = assert(vim.uv.cwd())
    local root = util.root_pattern('artisan')(fname)

    -- prefer cwd if root is a descendant
    on_dir(vim.fs.relpath(cwd, root) and cwd or root)
  end,
}
