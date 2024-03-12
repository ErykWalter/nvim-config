return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        local handlers = {
            function (server_name) -- default handler (optional)
                lspconfig[server_name].setup {}
            end,

            ["lua_ls"] = function ()
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
           end,
        }

        -- alt 1. Either pass handlers when setting up mason-lspconfig:
        require("mason-lspconfig").setup({ })

        mason.setup()
        mason_lspconfig.setup {
            ensure_installed = {
                "lua_ls",             -- LSP for Lua language
                "pyright",            -- LSP for Python
                "elixirls",           -- LSP for Elixir
                "rust_analyzer",      -- LSP for Rust
            },
            handlers = handlers,
        }
        mason_tool_installer.setup {
            ensure_installed = {
                "eslint_d",           -- Linter for JavaScript
                "pylint",             -- Linter for Python
            },
        }
    end,
}
