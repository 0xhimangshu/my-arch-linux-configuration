require("lazy").setup({
  { "neoclide/coc.nvim", branch = "release" },
  { 'IogaMaster/neocord', event = "VeryLazy"},
  {
    "AstroNvim/AstroNvim",
    version = "^4",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
      update_notifications = true,
    },
  },
  { import = "community" },
  { import = "plugins" },

  -- Python LSP (pyright) setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = function()
                -- Detect Python from the virtual environment
                local venv = os.getenv("VIRTUAL_ENV")
                if venv then
                  return venv .. "/bin/python"
                else
                  return vim.fn.exepath("python3") or "/usr/bin/python3"
                end
              end,
            },
          },
        },
      },
    },
  },
}, {
  install = { colorscheme = { "astrodark", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
})
