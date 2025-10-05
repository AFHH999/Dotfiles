return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "gb",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Snipe buffer menu",
    },
  },
  opts = {
    ui = {
      max_height = -1, -- -1 = dynamic height
      position = "topleft", -- "topleft", "bottomleft", "topright", "bottomright", "center", "cursor"
      open_win_override = {
        border = "rounded", -- or "single", "double", "shadow"
      },
      preselect_current = true, -- highlight current buffer
      text_align = "file-first", -- "left", "right", "file-first"
      persist_tags = true, -- remember tags for buffers
    },

    hints = {
      dictionary = "sadflewcmpghio", -- characters for hints
      prefix_key = ".", -- used to disambiguate when tags persist
    },

    navigate = {
      leader = ",", -- Snipe’s "leader" (not your Neovim leader)
      leader_map = {
        ["d"] = function(m, i)
          require("snipe").close_buf(m, i)
        end,
        ["v"] = function(m, i)
          require("snipe").open_vsplit(m, i)
        end,
        ["h"] = function(m, i)
          require("snipe").open_split(m, i)
        end,
      },
      next_page = "J",
      prev_page = "K",
      under_cursor = "<cr>",
      cancel_snipe = "<esc>",
      close_buffer = "D",
      open_vsplit = "V",
      open_split = "H",
    },

    sort = "last", -- "last" = last used buffers first
  },
}
