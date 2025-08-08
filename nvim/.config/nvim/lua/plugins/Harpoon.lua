return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED: initialize Harpoon
    harpoon:setup()

    -- Example keymaps (customize to your liking)
    local keymap = vim.keymap.set
    keymap("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Harpoon Add File" })
    keymap("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Menu" })

    -- Optional: keymaps to navigate items
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
      harpoon:list():select(4)
    end, { desc = "Harpoon 5" })
  end,
}
