vim.opt.wrap = false
vim.g.mapleader = ' '

-- Prepend lazy.nvim to the runtime path
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Set up lazy.nvim with your desired plugins
require('lazy').setup({
	-- Example plugins
      	{ 'nvim-lua/plenary.nvim' },  -- Required for many plugins
   	{ 'nvim-telescope/telescope.nvim' },
   	{ 'MattesGroeger/vim-bookmarks' },
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	{ 'neovim/nvim-lspconfig' }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp", "python", "c_sharp" }, -- Install parsers for C, C++, and Python
      	highlight = {
        	enable = true,              -- Enable highlighting
        	additional_vim_regex_highlighting = false,
      	},
}

local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup{}

-- C/C++
lspconfig.clangd.setup{}

local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Add the on_attach function to each server setup
lspconfig.pyright.setup{ on_attach = on_attach }
lspconfig.clangd.setup{ on_attach = on_attach }
lspconfig.omnisharp.setup{ on_attach = on_attach }

