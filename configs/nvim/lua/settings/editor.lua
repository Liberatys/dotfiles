vim.o.autowrite = true
vim.o.synmaxcol = 200
vim.o.title = true
vim.o.signcolumn = "yes"
vim.o.encoding = "utf-8"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cmdheight = 1
vim.o.cmdwinheight = 5
vim.o.wildmenu = true
vim.opt.wildignore:append(".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif")
vim.opt.wildignore:append("*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**")
vim.o.redrawtime = 1500
vim.o.hidden = true
vim.o.wildignorecase = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false


vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.formatoptions = "qj"
