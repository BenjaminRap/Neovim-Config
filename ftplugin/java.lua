local jdtls = require("jdtls")
local lspshared = require("config.lspshared")

local home = os.getenv("HOME")

local workspace_folder = home .. "/.local/share/eclipse/" ..
    vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local bundles = {
    vim.fn.glob(
        home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        true
    ),
}

vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(
            home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar",
            true
        ),
        "\n"
    )
)

local config = {
    cmd = {
        "jdtls",
        "-data", workspace_folder,
    },

    root_dir = require("jdtls.setup").find_root({
        "build.gradle",
        "gradlew",
        ".git",
        "pom.xml",
    }),

    init_options = {
        bundles = bundles,
    },
	on_attach = lspshared.on_attach_common,
	capabilities = lspshared.capabilities
}

jdtls.start_or_attach(config)
vim.keymap.set("n", "<leader>jo", function()
    jdtls.organize_imports()
end)

vim.keymap.set("n", "<leader>jv", function()
    jdtls.extract_variable()
end)

vim.keymap.set("v", "<leader>jm", function()
    jdtls.extract_method({visual = true})
end)

vim.keymap.set("n", "<leader>jt", function()
    jdtls.test_class()
end)

vim.keymap.set("n", "<leader>jn", function()
    jdtls.test_nearest_method()
end)
jdtls.setup_dap()
