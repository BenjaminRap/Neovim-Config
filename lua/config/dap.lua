local M = {}

local dap = require("dap")

-- =========================================================
-- 🔵 TON CONFIG C (INCHANGÉ)
-- =========================================================

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = {
		"--interpreter=dap",
		"--eval-command",
		"set print pretty on"
	},
	name = "gdb"
}

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		pid = function()
			local name = vim.fn.input('Executable name (filter): ')
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = '${workspaceFolder}'
	},
	{
		name = 'Attach to gdbserver :1234',
		type = 'gdb',
		request = 'attach',
		target = 'localhost:1234',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}'
	},
}

dap.configurations.cpp = dap.configurations.c

-- =========================================================
-- 🟢 JAVA (Minecraft ONLY AJOUT)
-- =========================================================

-- dap.adapters.java = function(callback)
-- 	callback({
-- 		type = "server",
-- 		host = "127.0.0.1",
-- 		port = 5005,
-- 	})
-- end

dap.configurations.java = {
	{
		name = "Attach to localhost:5005",
		type = "java",
		request = "attach",
		hostName = "127.0.0.1",
		port = 5005,
	},
	{
		name = "Attach to Port (Localhost)",
		type = "java",
		request = "attach",
		hostName = "127.0.0.1",
		port = function()
			return vim.fn.input('Port: ', '5005')
		end,
	},
}

-- =========================================================
-- Python
-- =========================================================

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return os.getenv("VIRTUAL_ENV") .. "/bin/python"
    end,
  },
}

-- =========================================================
-- 🪟 UI
-- =========================================================

function M.setup_ui()
	local dapui = require("dapui")

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
end

return M
