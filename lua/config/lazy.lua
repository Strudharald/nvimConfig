-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },

    {"williamboman/mason.nvim"},

    {"github/copilot.vim"},

    {"neoclide/coc.nvim", branch = "release"},

     {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    {"rebelot/kanagawa.nvim"},

    {'neovim/nvim-lspconfig'},

    {'hrsh7th/cmp-nvim-lsp'},

    {'hrsh7th/nvim-cmp'},

    {
      "S1M0N38/love2d.nvim",
      cmd = "LoveRun",
      opts = { },
      keys = {
        { "<leader>v", ft = "lua", desc = "LÖVE" },
        { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
        { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
      },
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "kanagawa-wave" } },
            {"S1M0N38/love2d"},
  -- automatically check for plugin updates
  checker = { enabled = true },
})
