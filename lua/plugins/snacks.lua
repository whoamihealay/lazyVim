return {
  {
    "snacks.nvim",
    opts = {
      -- animate = { enabled = true },
      -- bigfile = { enabled = true },
      -- bufdelete = { enabled = true },
      -- dashboard = { enabled = true },
      -- debug = { enabled = true },
      -- dim = { enabled = true },
      explorer = { enabled = true, replace_netrw = false },
      -- gh = { enabled = true },
      git = { enabled = true },
      -- gitbrowse = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      -- keymap = { enabled = true },
      -- layout = { enabled = true },
      lazygit = { enabled = true },
      -- notifier = { enabled = true },
      -- notify = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          files = {
            hidden = false,
            ignored = false,
          },
        },
        previewers = {
          diff = {
            style = "syntax",
          },
        },
      },
      -- profiler = { enabled = true },
      -- quickfile = { enabled = true },
      -- rename = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      -- toggle = { enabled = true },
      -- util = { enabled = true },
      -- win = { enabled = true },
      words = { enabled = true },
      -- zen = { enabled = true }
    },
    keys = {
      -- Misc
      {
        "<C-p>",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
    },
  },
}
