local M = {}

local dap = require("dap")

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})

-- =========================================================
-- 🔵 CONFIG C/C++
-- =========================================================

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = {"--port", "${port}"},
  }
}

local function get_program_and_args()
	local program = vim.fn.input({
		prompt = "Executable",
		default = "./",
		completion = "file",
		cancelreturn = "__CANCEL__"
	})

    if program == "__CANCEL__" then
        return nil, {}
    end

    local args = {}

    while true do
        local arg = vim.fn.input({
            prompt = string.format("Argument %d: ", #args + 1),
			default = "",
			completion = "file",
			cancelreturn = "__CANCEL__"
		})

        if arg == "__CANCEL__" then
            break
        end

        table.insert(args, arg)
    end

    return program, args
end

dap.configurations.cpp = {
    -- --------------------------------------------------------
    -- Launch
    -- --------------------------------------------------------
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",

        program = function()
            local program, args = get_program_and_args()

            if not program then
                return nil
            end

            vim.g.dap_program_args = args

            return program
        end,

        args = function()
            return vim.g.dap_program_args or {}
        end,

        cwd = "${workspaceFolder}",

        stopOnEntry = false,
    },
    {
        name = "Attach",
        type = "codelldb",
        request = "attach",

        pid = function()
            local pid = vim.fn.input("PID: ")

            if pid == "" then
                return nil
            end

            return tonumber(pid)
        end,

        cwd = "${workspaceFolder}",
    },
}

dap.configurations.c = dap.configurations.cpp

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
