local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup {
  ignored_next_char = [=[[%w%%%'%[%"%.%`]]=]
}

local cond = require('nvim-autopairs.conds')
local utilz = require('nvim-autopairs.utils')

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    :with_move(function(opts) return opts.char == '$' end)
    :with_cr(cond.none()),
})

npairs.remove_rule("[")
npairs.remove_rule("{")

npairs.add_rules{
  Rule("[", "]", {"-tex", "-latex"})
    :with_move(cond.move_right())
}
npairs.add_rules{
  Rule("{", "}", {"-tex", "-latex"})
    :with_move(cond.move_right())
}

npairs.add_rules{
  Rule("[", "]", {"tex", "latex"})
    :with_pair(function(opts)
      local char = utilz.get_prev_char(opts)
      if char == "\\" then
        return false
      else return true
      end
    end)
    :with_move(cond.move_right()),
}

npairs.add_rules{
  Rule("{", "}", {"tex", "latex"})
    :with_pair(function(opts)
      local char = utilz.get_prev_char(opts)
      if char == "\\" then
        return false
      else return true
      end
    end)
    :with_move(cond.move_right())
}

npairs.add_rules{
  Rule("\\{", "\\}", {"tex", "latex"}),
  Rule("\\[", "\\]", {"tex", "latex"})
}
