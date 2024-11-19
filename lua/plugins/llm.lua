return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        opts = {
            provider = "copilot",
            auto_suggestions_provider = "copilot",
            behaviour = {
                auto_suggestions = true,
            },
            mappings = require("mappings").avante,
        },
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",

            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                    checkbox = {
                        custom = {
                            todo = {
                                raw = "[TODO]",
                                rendered = "󰄱 ",
                                highlight = "RenderMarkdownUnchecked",
                            },
                            waiting = {
                                raw = "[WAITING]",
                                rendered = "󰥔 ",
                                highlight = "DiagnosticWarn",
                            },
                        },
                    },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
