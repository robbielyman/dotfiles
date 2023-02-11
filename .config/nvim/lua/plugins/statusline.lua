local weather = "weather"
local job = nil
local last = os.time()

local function wttr_comp()
  if job then
    if os.time() - last < 300 then return weather end
  end
  last = os.time()
  local Job = require 'plenary.job'
  job = Job:new{
    command = 'curl',
    args = { 'wttr.in/?format=%l:\\n+%c%f\\n'},
    cwd = '/usr/bin',
    env = {},
    on_exit = function (j, ret)
      if ret ~= 0 then return end
      local tbl = j:result()
      if not tbl[1] then return end
      if string.find(tbl[1], "Brooklyn") then
        weather = "bklyn" .. tbl[2]
      elseif string.find(tbl[1], "North Brunswick") then
        weather = "nwrk:" .. tbl[2]
      else
        weather = tbl[2]
      end
    end
  }:start()
  return weather
end

return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
    opts = {
      options = {
        theme = 'catppuccin',
      },
      sections = { lualine_x = {'encoding', wttr_comp, 'filetype'}, },
      extensions = { 'quickfix' }
    }
  },
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  }
}
