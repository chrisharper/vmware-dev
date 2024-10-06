local indent = 2
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Completion options
vim.opt.cursorline = true                               -- Highlight cursor line
vim.opt.expandtab = true                                -- Use spaces instead of tabs
vim.opt.hidden = true                                   -- Enable background buffers
vim.opt.ignorecase = true                               -- Ignore case
vim.opt.joinspaces = false                              -- No double spaces with join
vim.opt.list = true                                     -- Show some invisible characters
vim.opt.number = true                                   -- Show line numbers
vim.opt.relativenumber = true                           -- Relative line numbers
vim.opt.scrolloff = 4                                   -- Lines of context
vim.opt.shell = 'bash --login'
vim.opt.shiftround = true                               -- Round indent
vim.opt.shiftwidth = indent                             -- Size of an indent
vim.opt.sidescrolloff = 8                               -- Columns of context
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true                                -- Do not ignore case with capitals
vim.opt.smartindent = true                              -- Insert indents automatically
vim.opt.splitbelow = true                               -- Put new windows below current
vim.opt.splitright = true                               -- Put new windows right of current
vim.opt.tabstop = indent                                -- Number of spaces tabs count for
vim.opt.termguicolors = true                            -- True color support
vim.opt.wildmode = { 'list', 'longest' }                -- Command-line completion mode
vim.opt.wrap = false                                    -- Disable line wrap

vim.g.mapleader = ' '
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- git gutter line
  {
  'lewis6991/gitsigns.nvim',opts={}
  },
  --colorscheme
  {
    "gruvbox-community/gruvbox",
    config = function()
      vim.cmd 'colorscheme gruvbox'
    end
  },
  -- syntax
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.configs').setup({ ensure_installed = 'all' })
    end
  },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim'}
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim'},
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end 
  },
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'hrsh7th/cmp-buffer'},     -- Optional
    {'hrsh7th/cmp-path'},     -- Optional
    {'hrsh7th/cmp-nvim-lsp'},     -- Optional
  }
}
,
},{})


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


local cmp = require('cmp')


cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
  },
  mapping = {
  }
})

-- telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files() <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep() <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers() <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fG", "<Cmd>lua require('telescope.builtin').git_commits() <CR>", { noremap = true })

