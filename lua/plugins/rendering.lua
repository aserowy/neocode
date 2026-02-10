return {
    "nvim-tree/nvim-web-devicons",
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
            file_types = { "markdown" },
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
    }
}
