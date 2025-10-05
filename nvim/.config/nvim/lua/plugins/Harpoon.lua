return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true, -- auto-save when toggling UI
        sync_on_ui_close = true, -- keep state in sync
      },
      default = {
        -- Always use full path when adding files
        create_list_item = function(_, path)
          path = path or vim.api.nvim_buf_get_name(0) -- current buffer path
          return {
            value = vim.fn.fnamemodify(path, ":p"), -- absolute path
            context = {},
          }
        end,
        -- Show full path in the quick menu
        display = function(item)
          return item.value
        end,
      },
    })

    -- Keymaps
    local keymap = vim.keymap.set
    keymap("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon Add File" })
    keymap("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Menu" })

    -- Jump directly to slots
    keymap("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon 1" })
    keymap("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon 2" })
    keymap("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon 3" })
    keymap("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon 4" })
    keymap("n", "<leader>5", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon 5" })

    -- Cycle through list
    keymap("n", "<C-n>", function()
      harpoon:list():next()
    end, { desc = "Harpoon Next" })
    keymap("n", "<C-p>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon Prev" })
  end,
}
