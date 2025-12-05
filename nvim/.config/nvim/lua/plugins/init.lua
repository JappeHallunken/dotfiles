return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "camspiers/luarocks",
    dependencies = {
      "rcarriga/nvim-notify", -- Optional dependency
    },
    opts = {
      rocks = { "fzy" }, -- Specify LuaRocks packages to install
    },
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = true,
    lazy = false,
  },

  {
    "epwalsh/pomo.nvim",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- See below for full list of options 👇
      notifiers = {
        -- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
        {
          name = "Default",
          opts = {
            -- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
            -- continuously displayed. If you only want a pop-up notification when the timer starts
            -- and finishes, set this to false.
            sticky = false,
            -- Configure the display icons:
            title_icon = "󱎫",
            text_icon = "󰄉",
            -- Replace the above with these if you don't have a patched font:
            -- title_icon = "⏳",
            -- text_icon = "⏱️",
          },
        },
      },
      sessions = {
        -- Example session configuration for a session called "pomodoro".
        pomodoro = {
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Long Break", duration = "15m" },
        },
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "github/copilot.vim",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "npm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = "-",
          },
          enable = true, -- Chunk-Highlight aktivieren
          style = {
            { fg = "#7a823c" },
            { fg = "#8a2916" },
          },
          duration = 50,
          delay = 500,
          notify = false, -- keine Notifications
          priority = 10, -- höher als indent, damit sichtbar
          exclude_filetypes = {
            "dashboard",
            "aerial",
            "NvimTree",
            "packer",
          },
        },
        line_num = {
          enable = true,
          style = "#7a823c",
        },
      }

      -- toggle command
      _G.hlchunk_enabled = true

      vim.api.nvim_create_user_command("HlChunkToggle", function()
        local chunk = require "hlchunk.mods.chunk"
        local line_num = require "hlchunk.mods.line_num"

        if _G.hlchunk_enabled then
          chunk({}):disable()
          line_num({}):disable()
          _G.hlchunk_enabled = false
        else
          chunk({ style = { { fg = "#7a823c" } } }):enable()
          line_num({ style = "#7a823c" }):enable()
          _G.hlchunk_enabled = true
        end
      end, {})
    end,
  },
  {
    "Exafunction/windsurf.vim",
    event = "BufEnter",
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
-- {
--   "echasnovski/mini.nvim",
--   lazy = false,
--   version = false,
--   config = function()
--     require("mini.indentscope").setup {
--       symbol = "│",
--       options = { try_as_border = true },
--     }
--   end,
-- },
