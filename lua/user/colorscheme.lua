local M = {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "nightfox"
function M.config()
    local Shade = require "nightfox.lib.shade"
    local palettes = {
        all = {
            black = Shade.new("#393b44", 0.15, -0.15),
            red = Shade.new("#ff8787", 0.15, -0.15),
            green = Shade.new("#87d75f", 0.15, -0.15),
            yellow = Shade.new("#ffd75f", 0.15, -0.15),
            blue = Shade.new("#87d7ff", 0.15, -0.15),
            magenta = Shade.new("#c586c0", 0.15, -0.15),
            cyan = Shade.new("#3af2e9", 0.15, -0.15),
            white = Shade.new("#d4d4d4", 0.15, -0.15),
            orange = Shade.new("#ffaf5f", 0.15, -0.15),
            pink = Shade.new("#ff005f", 0.15, -0.15),
            comment = "#808080",
            bg0 = "#252525",
            bg1 = "#1E1E1E",
            bg2 = "#313131",
            bg3 = "#333333",
            bg4 = "#444444",
            fg1 = "#d4d4d4",
            fg2 = "#c4c4c4",
            fg3 = "#808080",
            sel0 = "#606060",
            sel1 = "#305070",
        },
    }

    local specs = {
        all = {
            syntax = {
                bracket = "white", -- Brackets and Punctuation
                builtin0 = "white", -- Builtin variable
                builtin1 = "red", -- Builtin type
                builtin2 = "cyan", -- Builtin const
                builtin3 = "red", -- Not used
                comment = "comment", -- Comment
                conditional = "blue", -- Conditional and loop
                const = "white", -- Constants, imports and booleans
                dep = "pink.dim", -- Deprecated
                field = "magenta", -- Field
                func = "green", -- Functions and Titles
                ident = "magenta.bright", -- Identifiers
                keyword = "blue", -- Keywords
                number = "orange", -- Numbers
                operator = "white", -- Operators
                preproc = "pink", -- PreProc
                regex = "yellow.bright", -- Regex
                statement = "blue.dim", -- Statements
                string = "yellow", -- Strings
                type = "red", -- Types
                variable = "white", -- Variables,
            },
        },
    }

    local groups = {
        all = {
            -- Editor
            Whitespace = { fg = palettes.all.white },

            -- Treesitter
            TSConstructor = { link = "Function" },
            TSFuncBuiltin = { link = "Function" },
            TSMethod = { link = "Function" },
            ["@boolean.cpp"] = { link = "Conditional" },
            ["@type.qualifier.cpp"] = { link = "Keyword" },
            ["@keyword.return.cpp"] = { link = "Keyword" },
            ["@function.builtin"] = { link = "Function" },
            ["@storageclass.cpp"] = { link = "Keyword" },
            ["@parameter"] = { fg = palettes.all.white.bright, style = "italic" },
            ["@keyword.doxygen"] = { link = "Comment" },
            ["@variable.parameter.doxygen"] = { link = "Comment" },
            ["@punctuation.bracket.doxygen"] = { link = "Comment" },
            ["@punctuation.delimiter.doxygen"] = { link = "Comment" },
            ["@keyword.modifier.doxygen"] = { link = "Comment" },

            -- Telescope
            TelescopeBorder = { fg = palettes.all.blue },
            TelescopeSelection = { fg = palettes.all.blue },
            TelescopeMatching = { fg = palettes.all.yellow, style = "bold" },

            -- LSP
            LspReferenceText = { bg = palettes.all.bg3 },
            LspReferenceWrite = { bg = palettes.all.bg3 },
            LspReferenceRead = { bg = palettes.all.bg3 },
            ["@lsp.typemod.variable.globalScope.cpp"] = { fg = palettes.all.pink.dim },
            ["@lsp.type.operator.cpp"] = { link = "Operator" },
            ["@lsp.mod.constructorOrDestructor.cpp"] = { link = "Function" },

            -- IndentBlankline
            IndentBlanklineIndent1 = { fg = palettes.all.sel0 },
        },
    }
    require("nightfox").setup {
        options = {
            styles = {
                comments = "italic",
                conditionals = "bold",
                keywords = "bold",
            },
            inverse = {},
        },
        palettes = palettes,
        specs = specs,
        groups = groups,
    }
    local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
    if not status_ok then
        return
    end
end

return M
