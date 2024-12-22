-- Setup a debuger for python
return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dap_python = require("dap-python")
    local dapui = require("dapui")

    -- Basic UI setup
    dapui.setup()

    -- Python setup using Mason's debugpy
    local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
    dap_python.setup(debugpy_path)

    -- Set pytest as the default test runner
    dap_python.test_runner = "pytest"

    -- Add custom configurations
    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "Python: Current File (Integrated Terminal)",
      program = "${file}",
      console = "integratedTerminal",
      justMyCode = false,
      pythonPath = function()
        -- Check for virtual environment
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if venv then
          return venv .. "/bin/python"
        end

        -- Check common virtual environment directories
        local common_venvs = { "venv", ".venv", "env", ".env" }
        for _, folder in ipairs(common_venvs) do
          local path = vim.fn.getcwd() .. "/" .. folder .. "/bin/python"
          if vim.fn.executable(path) == 1 then
            return path
          end
        end

        -- Fallback to system Python
        return "python3"
      end,
    })

    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "Python: Django",
      program = "${workspaceFolder}/manage.py",
      args = { "runserver" },
      django = true,
      pythonPath = function()
        -- Same virtual environment detection as above
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if venv then
          return venv .. "/bin/python"
        end
        return "python3"
      end,
    })

    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "Python: Flask",
      module = "flask",
      args = { "run", "--no-debugger", "--no-reload" },
      env = {
        FLASK_APP = "${workspaceFolder}/app.py",
      },
      jinja = true,
      pythonPath = function()
        -- Same virtual environment detection as above
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if venv then
          return venv .. "/bin/python"
        end
        return "python3"
      end,
    })

    -- Key mappings
    -- Debug controls
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })

    -- Breakpoints
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Conditional Breakpoint" })

    -- Python specific
    vim.keymap.set("n", "<Leader>dn", dap_python.test_method, { desc = "Debug Test Method" })
    vim.keymap.set("n", "<Leader>df", dap_python.test_class, { desc = "Debug Test Class" })
    vim.keymap.set("v", "<Leader>ds", dap_python.debug_selection, { desc = "Debug Selection" })

    -- UI controls
    vim.keymap.set("n", "<Leader>dui", function()
      dapui.toggle()
    end, { desc = "Toggle DAP UI" })

    -- Auto commands for DAP events
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dap-repl",
      callback = function()
        require("dap.ext.autocompl").attach()
      end,
    })

    -- Automatically open UI when debugging starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    -- Automatically close UI when debugging ends
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
