require('gitsigns').setup{}
require('diffview').setup{}
require('lualine').setup{}
require('stabilize').setup{}

require('spellsitter').setup{}
require('Comment').setup{}
require('todo-comments').setup{}
require('trouble').setup{}
require('go').setup{}

require('which-key').setup{}
require('spectre').setup{}
require('nvim-autopairs').setup{}
require('marks').setup{}

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
