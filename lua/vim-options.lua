vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = ' '

-- softer UI
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.number = true
vim.opt.relativenumber = true

-- “retro”: less noise
vim.diagnostic.config({
    virtual_text = false,   -- turn off inline spam
    severity_sort = true,
    float = { border = "rounded" },
})

