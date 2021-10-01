require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = "<Leader>"
            }
        },
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    main = "~/neorg",
                    gtd = "~/gtd"
                }
            }
        },
        ["core.ui"] = {},
--        ["core.gtd.base"] = {
--                  config = { workspace = "gtd" }
--        },
        ["core.norg.completion"] = {
	        config = {
		        engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
            }
        },
    },
}
