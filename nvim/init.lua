-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "<C-J>", "<C-W>j<C-W>_", { silent = true })
vim.keymap.set("n", "<C-K>", "<C-W>k<C-W>_", { silent = true })
vim.keymap.set("n", "<C-H>", "<C-W>h<C-W>|", { silent = true })
vim.keymap.set("n", "<C-L>", "<C-W>l<C-W>|", { silent = true })
