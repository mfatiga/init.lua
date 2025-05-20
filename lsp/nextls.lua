return {
  cmd = {"nextls", "--stdio"},
  init_options = {
    extensions = {
      credo = { enable = true }
    },
    experimental = {
      completions = { enable = true }
    },
  },
}
