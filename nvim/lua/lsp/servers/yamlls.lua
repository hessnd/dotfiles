local M = {}

M.settings = {
  yaml = {
    schemas = {
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/**/*",
      ["https://json.schemastore.org/github-action.json"] = "/.github/actions/**/*"
    }
  }
}

return M
