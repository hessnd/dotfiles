return {
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-jest"] = {
          jestCommand = "npx jest",
          jestConfigFile = function(file)
            if string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.js"
          end,
          env = { CI = false },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
          floating = {
            border = "rounded",
            max_height = 0.6,
            max_width = 0.6,
          },
          highlights = {
            adapter_name = "NeotestAdapterName",
            border = "NeotestBorder",
            dir = "NeotestDir",
            expand_marker = "NeotestExpandMarker",
            failed = "NeotestFailed",
            file = "NeotestFile",
            focused = "NeotestFocused",
            indent = "NeotestIndent",
            namespace = "NeotestNamespace",
            passed = "NeotestPassed",
            running = "NeotestRunning",
            skipped = "NeotestSkipped",
            test = "NeotestTest",
          },
          icons = {
            child_indent = "│",
            child_prefix = "├",
            collapsed = "─",
            expanded = "╮",
            failed = "✖",
            final_child_indent = " ",
            final_child_prefix = "╰",
            non_collapsible = "─",
            passed = "✔",
            running = "",
            skipped = "ﰸ",
            unknown = "?",
          },
          output = {
            enabled = true,
            open_on_run = true,
          },
          run = {
            enabled = true,
          },
          status = {
            enabled = true,
          },
          strategies = {
            integrated = {
              height = 40,
              width = 120,
            },
          },
          summary = {
            enabled = true,
            expand_errors = true,
            follow = true,
            mappings = {
              attach = "a",
              expand = { "<CR>", "<2-LeftMouse>" },
              expand_all = "e",
              jumpto = "i",
              output = "o",
              run = "r",
              short = "O",
              stop = "u",
            },
          },
        },
      },
    },
  },
}