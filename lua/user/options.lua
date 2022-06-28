-- History
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.backup = false                          -- disable backup file
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.writebackup = false                     -- disable file backups
vim.opt.swapfile = false                        -- disable swapfile
vim.opt.shortmess:append "c"

-- GUI
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.ruler = false                           -- disable the line ruler
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8                           -- Scroll already before reaching the end (vertically)
vim.opt.sidescrolloff = 8                       -- Scroll already before reaching the end (horizontally)
vim.opt.laststatus = 3                          -- Show the last status messages
vim.opt.showcmd = false                         -- disable command output in GUI

-- Editor
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.wildmode = "longest:full,full"          -- wildemenu behavior
vim.opt.list = true                             -- show special chars
vim.opt.listchars = "trail: ,tab:>•"            -- special chars to show
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.wrap = true                             -- display lines as one long line
vim.opt.showbreak = "+++"                       -- line break marker
vim.opt.whichwrap:append("<,>,[,],h,l")         -- Wrap chars
vim.opt.fillchars.eob=" "                       -- char markers for empty lines
vim.opt.iskeyword:append("-")                   -- add dash to word chars list

-- Indentation
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab

-- Search
vim.opt.smartcase = true                        -- smart case
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
