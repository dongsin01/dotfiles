return {
  -- Noice
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    enabled = true,
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          view = "mini",
          opts = { skip = true },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- inc-rename.nvim is not installed
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    -- keys belong on the plugin spec, not inside opts, or lazy.nvim ignores them
    keys = {
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" },
      },
    },
  },

  -- dressing
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },
}
