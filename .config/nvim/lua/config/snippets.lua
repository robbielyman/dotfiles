local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})

local function copy(args)
    return args[1]
end

ls.snippets = {
    all = {
    },
    tex = {
        s("\\begin", {
            t("\\begin{"), i(1, "environment"), t({ "}", "\t"}), i(2),
            t({ "", "\\end{"}), f(copy, 1), t("}"), i(0),
        }),
        s("\\frac", {
            t("\\frac{"), i(1,"1"), t("}{"), i(2), t("}"), i(0),
        }),
        s("\\left", {t("\\left"), i(1,"("), i(2), t("\\right"), i(3, ")"), i(0)}),
    }
}

ls.autosnippets = {
    all = {
        s({trig = "()", wordTrig = false}, {t("("), i(1), t(")"), i(0),}),
        s({trig = "{}", wordTrig = false}, {t("{"), i(1), t("}"), i(0),}),
        s({trig = "[]", wordTrig = false}, {t("["), i(1), t("]"), i(0),}),
        s({trig = "\"\"", wordTrig = false}, {t("\""), i(1), t("\""), i(0)}),
    },
    tex = {
        s({trig = "$$", wordTrig = false}, {t("$"), i(1), t("$"), i(0),}),
        s({trig = "\\[", wordTrig = false}, {t("\\[\t"), i(1), t("\\]"), i(0),}),
        s({trig = "^^", wordTrig = false}, {t("^{"), i(1, "-1"), t("}"), i(0),}),
        s({trig = "__", wordTrig = false}, {t("_{"), i(1), t("}"), i(0),}),
        s({trig = "\\{\\}", wordTrig = false}, {t("\\{"), i(1), t("\\}"), i(0),}),
    }
}


