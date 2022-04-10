local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        layout_config = {
            bottom_pane = {
                preview_cutoff = 1200,
            },
        },
    },
})
