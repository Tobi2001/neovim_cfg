local octo_status_ok, octo = pcall(require, "octo")
if not octo_status_ok then
    return
end

octo.setup({
  default_remote = {"origin"}, -- order to try remotes
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
    review_diff = {
      add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<space>t", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    },
  }
})
