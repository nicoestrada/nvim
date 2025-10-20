vim.o.clipboard = "unnamedplus"
require("config.lazy")
vim.schedule(function()
  local ok = pcall(function()
    vim.lsp.enable({ "luals", "rust_analyzer", "copilot" })
  end)
  if not ok then
    vim.notify("Copilot LSP not ready yet", vim.log.levels.WARN)
  end
end)
