return {
  "BenjaminRap/nvim-reviewer",
  -- SSH, because the repository is private (HTTPS would ask for a login).
  -- If you make it public, this line can go.
  url = "git@github.com:BenjaminRap/nvim-reviewer.git",
  main = "reviewer",
  -- To work on the plugin itself, replace the name and `url` lines above by:
  -- dir = "~/Documents/nvim-reviewer",
  cmd = "Review", -- the only command: :Review <Tab> lists the subcommands
  keys = {
    { "<leader>r", nil, desc = "Review" },
    { "<leader>rv", "<cmd>Review<cr>", desc = "Start the review" },
    { "<leader>rb", "<cmd>Review browse<cr>", desc = "Review browser" },
    { "<leader>rq", "<cmd>Review quiz<cr>", desc = "Review quiz" },
    { "<leader>rP", "<cmd>Review progress<cr>", desc = "Review progress" },
  },
  opts = {
    colors = "vivid", -- green and red mixed into the tokyonight background; changed words stronger
    comments = "marker", -- a ✦ in the sign column; <leader>rh opens the comment (<leader>rc switches)
    key_hints = true, -- one-line key bar at the bottom, g? for every key (:Review keys hides it)
    -- in a reviewed file, <leader>e opens the review browser (like your :Oil mapping)
    keymaps = {
      file = { browse = "<leader>e" },
      -- same keys as the oil buffer (lua/config/oil.lua)
      browser = {
        open = { "<CR>", "<C-l>" },
        parent = { "-", "<C-h>" },
        open_vsplit = "<A-s>",
        open_split = "<A-h>",
        open_tab = "<A-t>",
        preview = "<A-p>",
        refresh = "<A-r>",
      },
    },
    repos = {
      corelab = {
        generated = {
          "^prisma/migrations/snapshots/", "^%.claude/", "prismaGenerated/",
          "^prisma/contract%.json$", "^prisma/contract%.d%.ts$",
          "^prisma/migrations/app/refs/", "^prisma/migrations/app/[^/]+/ops%.json$",
          "^prisma/migrations/app/[^/]+/migration%.json$", "^openspec/",
        },
        groups = {
          { label = "Tests", order = 90, patterns = { "/test/", "%.test%.", "vitest%.config" } },
          { label = "Database schema & migrations", order = 10, patterns = { "^prisma/" } },
          { label = "Shared code", order = 20, patterns = { "^src/shared/" } },
          { label = "Backend · lib", order = 30, patterns = { "^src/backend/src/lib/" } },
          { label = "Backend · routes", order = 40, patterns = { "^src/backend/src/routes/" } },
          { label = "Backend · sockets", order = 45, patterns = { "^src/backend/src/sockets/" } },
          { label = "Backend · other", order = 48, patterns = { "^src/backend/" } },
          { label = "Frontend · services, hooks, utils", order = 50, patterns = { "^src/frontend/src/services/", "^src/frontend/src/lib/", "^src/frontend/src/utils/", "^src/frontend/src/context/", "^src/frontend/src/constants/", "^src/frontend/src/types/" } },
          { label = "Frontend · components", order = 60, patterns = { "^src/frontend/src/components/" } },
          { label = "Frontend · pages & app", order = 66, patterns = { "^src/frontend/" } },
          { label = "Config, Docker, docs", order = 95, patterns = { "" } },
        },
      },
    },
  },
}
