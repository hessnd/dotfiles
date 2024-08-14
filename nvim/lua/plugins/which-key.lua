local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,   -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false,   -- default bindings on <c-w>
      nav = false,       -- misc bindings to work with windows
      z = false,         -- bindings for folds, spelling and others prefixed with z
      g = false,         -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  win = {
    border = "rounded",       -- none, single, double, shadow, rounded
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 4,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  -- ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = { "<leader>" },                                                    -- or specify a list manually
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
  c = {
    name = 'LSP',
    a = { 'code action' },
    d = { '<cmd>TroubleToggle<CR>', 'local diagnostics' },
    D = { '<cmd>Telescope diagnostics wrap_results=true<CR>', 'workspace diagnostics' },
    f = { 'format' },
    l = { 'line diagnostics' },
    r = { 'rename' },
    R = { 'structural replace' },
    t = { '<cmd>LspToggleAutoFormat<CR>', 'toggle format on save' },
  },
  f = {
    name = 'File',
    f = { '<cmd>lua require("plugins.telescope").project_files({ hidden = true, search_dirs = {"!.git/*","!.yarn/*"}})<CR>', 'find files' },
    a = { '<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>', 'find all' },
    b = { '<cmd>Telescope buffers<CR>', 'buffers' },
    w = { '<cmd>Telescope live_grep<CR>', 'grep' },
    h = { '<cmd>Telescope help_tags<CR>', 'help tags' },
    o = { '<cmd>Telescope oldfiles<CR>', 'old files' },
  },
  g = {
    name = 'Git',
    a = { '<cmd>!git add %:p<CR>', 'add current' },
    A = { '<cmd>!git add .<CR>', 'add all' },
    b = { '<cmd>lua require("internal.blame").open()<CR>', 'blame' },
    B = { '<cmd>Telescope git_branches<CR>', 'branches' },
    c = {
      name = 'Conflict',
      b = { '<cmd>GitConflictChooseBoth<CR>', desc = 'choose both' },
      n = { '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
      o = { '<cmd>GitConflictChooseOurs<CR>', desc = 'choose ours' },
      p = { '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
      t = { '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose theirs' },
    },
    h = {
      name = 'Hunk',
    },
    l = {
      name = 'Log',
      A = { '<cmd>lua require("plugins.telescope").my_git_commits()<CR>', 'commits (Telescope)' },
      a = { '<cmd>LazyGitFilter<CR>', 'commits' },
      C = { '<cmd>lua require("plugins.telescope").my_git_bcommits()<CR>', 'buffer commits (Telescope)' },
      c = { '<cmd>LazyGitFilterCurrentFile<CR>', 'buffer commits' },
    },
    m = { 'blame line' },
    s = { '<cmd>Telescope git_status<CR>', 'telescope status' },
    w = {
      name = 'Worktree',
      w = 'worktrees',
      c = 'create worktree',
    },
  },
  m = {
    name = "MultiCursors",
  },
  r = {
    name = 'Refactor',
  },
  s = {
    name = 'Search',
    c = { '<cmd>Telescope colorscheme<CR>', 'color schemes' },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
    h = { '<cmd>Telescope oldfiles hidden=true<CR>', 'file history' },
    H = { '<cmd>lua require("plugins.telescope").command_history()<CR>', 'command history' },
    s = { '<cmd>Telescope search_history theme=dropdown<CR>', 'search history' },
  },
  z = {
    name = 'UFO Folds',
    R = { '<cmd>lua require("ufo").openAllFolds<CR>', 'open all folds' },
    M = { '<cmd>lua require("ufo").closeAllFolds<CR>', 'close all folds' },
    r = { '<cmd>lua require("ufo").openFoldsExceptKinds<CR>', 'open all folds except kinds' },
  }
}
local visual_mode_mappings = {
  -- single
  ["s"] = { "<cmd>'<,'>sort<CR>", 'sort' },

  c = {
    name = "LSP",
    a = { 'range code action' },
    f = { 'range format' },
  },
}


-- wk.register(normal_mode_mappings, opts)
-- wk.register(visual_mode_mappings, visual_opts)

local function attach_mappings(table, mode)
  -- for loop to map normal_mode_mappings to wk.add syntax
  for key, value in pairs(table) do
    wk.add({
      { "<leader>" .. key, group = value.name, mode = mode },
    })
    for k, v in pairs(value) do
      if #v == 1 then
        wk.add({
          { "<leader>" .. key .. k, desc = v[1] , mode = mode }
        })
      else
        wk.add({
          { "<leader>" .. key .. k, v[1], desc = v[2], mode = mode }
        })
      end
      if type(v) == 'table' and v.name then
        for k1, v1 in pairs(v) do
          wk.add({
            { "<leader>" .. key .. k, group = v.name, mode = mode }
          })
          wk.add({
          { "<leader>" .. key .. k .. k1, v1[1], desc = v1[2], mode = mode }
          })
        end
      end
    end
  end
end

attach_mappings(normal_mode_mappings, "n")
attach_mappings(visual_mode_mappings, "v")

local function attach_typescript(bufnr)
  wk.add({
    { "<leader>c",  group = "LSP",                       desc = "LSP" },
    { "<leader>ce", "<cmd>TSC<CR>",                      desc = "workspace errors (TSC)" },
    { "<leader>cF", "<cmd>TSToolsFixAll<CR>",            desc = "fix all" },
    { "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>", desc = "import all" },
    { "<leader>co", "<cmd>TSToolsOrganizeImports<CR>",   desc = "organize imports" },
    { "<leader>cu", "<cmd>TSToolsRemoveUnused<CR>",      desc = "remove unused" },
    { "<leader>cr", "<cmd>TSToolsFileReferences<CR>",    desc = "find references" },
    { "<leader>cs", "<cmd>TSToolsGoToSourceDefinition<CR>",    desc = "go to source definition" },
  })
end

local function attach_jest(bufnr)
  wk.add({
    { "<leader>j",  group = "Jest", desc = "Jest" },
    { "<leader>ji", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "toggle info panel" },
    { "<leader>jj", "<cmd>lua require('neotest').run.run()<CR>", desc = "run nearest test" },
    { "<leader>jf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "run file" },
    { "<leader>jl", "<cmd>lua require('neotest').run.run_last()<CR>", desc = "run last test" },
    { "<leader>jo", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "open test output" },
    { "<leader>js", "<cmd>lua require('neotest').run.stop()<CR>", desc = "stop" },
  })
end

local function attach_spectre(bufnr)
  wk.add({
    { "<leader>R",  group = "Spectre", desc = "Spectre" },
    { "<leader>o", "<cmd>Spectre<CR>", desc = "show options" },
    { "<leader>q", "<cmd>SpectreSendToQuickfix<CR>", desc = "send all to quicklist" },
    { "<leader>v", "<cmd>SpectreView<CR>", desc = "change view mode" },
  })
  -- wk.register({
  --   ["R"] = { '[SPECTRE] Replace all' },
  --   ["o"] = { '[SPECTRE] Show options' },
  --   ["q"] = { '[SPECTRE] Send all to quicklist' },
  --   ["v"] = { '[SPECTRE] Change view mode' },
  -- }, {
  --   buffer = bufnr,
  --   mode = "n",     -- NORMAL mode
  --   prefix = "<leader>",
  --   silent = true,  -- use `silent` when creating keymaps
  --   noremap = true, -- use `noremap` when creating keymaps
  --   nowait = false, -- use `nowait` when creating keymaps
  -- })
end

local function attach_nvim_tree(bufnr)
  wk.add({
    { "<leader>=", "<cmd>NvimTreeResize +5<CR>", desc = "resize +5" },
    { "<leader>-", "<cmd>NvimTreeResize -5<CR>", desc = "resize -5" },
  })
end

local function attach_markdown(bufnr)
  wk.add({
    { "<leader>a",  group = "Actions", desc = "Actions" },
    { "<leader>am", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview" },
  })
end

wk.add({
  { "<leader>cc", group="Copilot Chat", desc = "Copilot Chat" }
})

return {
  attach_markdown = attach_markdown,
  attach_jest = attach_jest,
  attach_typescript = attach_typescript,
  attach_spectre = attach_spectre,
  attach_nvim_tree = attach_nvim_tree,
}
