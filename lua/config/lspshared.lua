local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach_common = function(client, bufnr)
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  })
  vim.lsp.inlay_hint.enable(true)
end

return M
