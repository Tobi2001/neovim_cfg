local octo_status_ok, octo = pcall(require, "octo")
if not octo_status_ok then
    return
end

octo.setup({
  default_remote = {"upstream", "origin"}, -- order to try remotes
  ssh_aliases = {""},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  reaction_viewer_hint_icon = "",         -- marker for user reactions
  user_icon = " ",                        -- user icon
  timeline_marker = "",                   -- timeline marker
  timeline_indent = "2",                   -- timeline indentation
  right_bubble_delimiter = "",            -- Bubble delimiter
  left_bubble_delimiter = "",             -- Bubble delimiter
  github_hostname = "",                    -- GitHub Enterprise host
  snippet_context_lines = 4,               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  mappings = {
    pull_request = {
      list_commits = { lhs = "<space>oc", desc = "list PR commits" },
      list_changed_files = { lhs = "<space>of", desc = "list PR changed files" },
      show_pr_diff = { lhs = "<space>od", desc = "show PR diff" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
    },
  }
})
