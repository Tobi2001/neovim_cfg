return {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "lalitmee/codecompanion-spinners.nvim"
    },
    opts = {
        opts = {
            log_level = "DEBUG",
        },
        display = {
            diff = {
                enabled = true,
                threshold_for_chat = 0,
            },
            chat = {
                window = {
                    layout = "vertical",
                    width = 0.4
                },
                opts = {
                    completion_provider = "cmp"
                },
                show_header_separator = false,
                -- editor_context = {
                --     ["buffer"] = {
                --         opts = {
                --             default_params = "diff",
                --         },
                --     },
                -- },
            }
        },
        adapters = {
            http = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                -- default = "claude-sonnet-5",
                                default = "gpt-6-luna",
                            },
                        },
                    })
                end,
            },
            acp = {
                copilot_acp = function()
                    return require("codecompanion.adapters").extend("copilot_acp", {
                        commands = {
                            default = { "copilot", "--acp", "--stdio", "--model", "gpt-5-mini",
                                "--disable-mcp-server", "codecraft_confluence",
                                "--disable-mcp-server", "codecraft_jira"
                            }
                        }
                    })
                end,
            }
        },
        interactions = {
            chat = {
                adapter = "copilot",
                -- adapter = {
                --     name = "ollama",
                --     model = "devstral-small-2:latest"
                -- },
                tools = {
                    ["grep_search"] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                    ["read_file"] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                },
                opts = {
                    context_management = {
                        enabled = true,
                    }
                }
            },
            inline = {
                -- adapter = "copilot",
                adapter = {
                    name = "ollama",
                    model = "devstral-small-2:latest"
                },
            },
            cmd = {
                adapter = "copilot",
            },
            background = {
                -- adapter = "copilot",
                adapter = {
                    name = "ollama",
                    model = "devstral-small-2:latest"
                },
            },
            cli = {
                agent = "copilot_cli",
                agents = {
                    copilot_cli = {
                        cmd = "copilot",
                        args = {},
                        description = "Copilot CLI",
                        provider = "terminal"
                    }
                },
                opts = {
                    auto_insert = true,
                    reload = true
                }
            }
        },
        extensions = {
            spinner = {
                opts = {
                    style = "lualine",
                },
            },
        },
        mcp = {
            servers = {
                ["aws_cli"] = {
                    cmd = { "uvx", "awslabs.aws-api-mcp-server@latest" },
                    env = {
                        AWS_REGION = "eu-central-1",
                        AWS_PROFILE = "llp-dev",
                    }
                },
                ["aws_docs"] = {
                    cmd = { "uvx", "awslabs.aws-documentation-mcp-server@latest" },
                    env = {
                        FASTMCP_LOG_LEVEL = "ERROR",
                    }
                }
            },
            opts = {
                default_servers = {},
            }
        }
    }
}
