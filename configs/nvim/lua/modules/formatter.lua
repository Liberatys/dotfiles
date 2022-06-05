require('formatter').setup({
    filetype = {
        ruby = {
            -- rubocop
            function()
                return {
                    exe = "rubocop", -- might prepend `bundle exec `
                    args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', "awk 'f; /^====================$/{f=1}'"},
                    stdin = true,
                }
            end
        },
        rust = {
            -- Rustfmt
            function()
                return {
                    exe = "rustfmt",
                    args = {"--emit=stdout"},
                    stdin = true
                }
            end
        },
        cpp = {
            -- clang-format
            function()
                return {
                    exe = "clang-format",
                    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                    cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
                }
            end
        },
        lua = {
            -- luafmt
            function()
                return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                }
            end
        },
    }
})
