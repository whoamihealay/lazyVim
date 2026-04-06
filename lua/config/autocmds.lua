-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Filetype detection for docker-compose files.
-- nvim-lspconfig's docker_compose_language_service only activates on the
-- "yaml.docker-compose" filetype, but no plugin auto-detects it.
vim.filetype.add({
  pattern = {
    ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
    ["compose%.ya?ml"] = "yaml.docker-compose",
  },
})
