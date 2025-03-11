vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":.lua<CR>")
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

local global = vim.g
local o = vim.opt

-- Editor options

o.number = true                            -- Print the line number in front of each line
o.relativenumber = true                    -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus"                -- uses the clipboard register for all operations except yank.
vim.opt.guicursor = "n-v-i-c:block-Cursor" -- sets the cursor to block in all modes
o.syntax = "on"                            -- When this option is set, the syntax with this name is loaded.
o.autoindent = true                        -- Copy indent from current line when starting a new line.
o.cursorline = true                        -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true                         -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2                           -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 8                              -- Number of spaces that a <Tab> in the file counts for.
o.softtabstop = 2
o.encoding = "UTF-8"                       -- Sets the character encoding used inside Vim.
o.ruler = true                             -- Show the line and column number of the cursor position, separated by a comma.
o.hidden = true                            -- When on a buffer becomes hidden when it is |abandon|ed
o.showmatch = true                         -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand =
"split"                                    -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Force python to indent at 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
