local status_ok, smart_splits = pcall(require, "smart-splits")
if not status_ok then
  return
end
smart_splits.setup {
  ignored_filetypes = {
    "nofile",
    "quickfix",
    "qf",
    "prompt",
  },
  ignored_buftypes = { "nofile" },
}

vim.keymap.set("n", "<C-w>h", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-w>j", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-k>k", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-w>l", require("smart-splits").resize_right)
