return {
    "olimorris/codecompanion.nvim",
    opts = {
        interactions = {
            chat = {
                adapter = "anthropic",
            },
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
