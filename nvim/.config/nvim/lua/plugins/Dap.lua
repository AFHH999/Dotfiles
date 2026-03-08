return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason-org/mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					automatic_installation = true,
					handlers = {},
					ensure_installed = {
						"delve",
					},
				},
			},
		},
		keys = {
			{ "<leader>di", function() require("dap").step_into() end, desc = "Debugger step into" },
			{ "<leader>do", function() require("dap").step_over() end, desc = "Debugger step over" },
			{ "<leader>dh", function() require("dap").step_out() end, desc = "Debugger step out" },
			{ "<leader>dc", function() require("dap").continue() end, desc = "Debugger continue" },
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debugger toggle breakpoint" },
			{
				"<leader>dcd",
				function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
				desc = "Debugger set conditional breakpoint",
			},
			{ "<leader>de", function() require("dap").terminate() end, desc = "Debugger reset" },
			{ "<leader>du", function() require("dapui").toggle() end, desc = "Debugger toggle UI" },
			{ "<leader>dr", function() require("dap").run_last() end, desc = "Debugger run last" },
			-- Standard IDE-style Debugging Shortcuts
			{ "<F5>", function() require("dap").continue() end, desc = "Debugger continue" },
			{ "<F10>", function() require("dap").step_over() end, desc = "Debugger step over" },
			{ "<F11>", function() require("dap").step_into() end, desc = "Debugger step into" },
			{ "<F12>", function() require("dap").step_out() end, desc = "Debugger step out" },
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
