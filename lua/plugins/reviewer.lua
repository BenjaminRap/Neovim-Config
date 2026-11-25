return {
  "BenjaminRap/nvim-reviewer",
  -- SSH, because the repository is private (HTTPS would ask for a login).
  -- If you make it public, this line can go.
  url = "git@github.com:BenjaminRap/nvim-reviewer.git",
  main = "reviewer",
  -- To work on the plugin itself, replace the name and `url` lines above by:
  -- dir = "~/Documents/nvim-reviewer",
  cmd = {
    "Review", "ReviewBrowse", "ReviewQuiz", "ReviewProgress",
    "ReviewAsks", "ReviewPrepare", "ReviewOverview", "ReviewFetch", "ReviewClean",
  },
  keys = {
    { "<leader>r", nil, desc = "Review" },
    { "<leader>rv", "<cmd>Review<cr>", desc = "Start the review" },
    { "<leader>rb", "<cmd>ReviewBrowse<cr>", desc = "Review browser" },
    { "<leader>rq", "<cmd>ReviewQuiz<cr>", desc = "Review quiz" },
    { "<leader>rP", "<cmd>ReviewProgress<cr>", desc = "Review progress" },
  },
  opts = {
    -- in a reviewed file, <leader>e opens the review browser (like your :Oil mapping)
    keymaps = { file = { browse = "<leader>e" } },
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
