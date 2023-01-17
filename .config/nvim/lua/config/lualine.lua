local Job = require('plenary.job')

local weather = "weather"
local job = nil
local last = os.time()

local function wttr_comp()
  if job then
    if os.time() - last < 300 then return weather end
  end
  last = os.time()
  job = Job:new{
    command = 'curl',
    args = { "wttr.in/?format=%l:\\n+%c%f\\n" },
    cwd = '/usr/bin',
    env = {},
    on_exit = function(j, ret)
      if ret ~= 0 then return end
      local tbl = j:result()
      if not tbl[1] then return end
      weather = tbl
      if string.find(weather[1], "Brooklyn") then
        weather = "bklyn:" .. weather[2]
      elseif string.find(weather[1], "Newark") then
        weather = "nwrk:" .. weather[2]
      else
        weather = weather[2]
      end
    end
  }:start()
  return weather
end

require('lualine').setup{
  options = {
    theme = 'tundra'
  },
  sections = { lualine_x = {'encoding', wttr_comp, 'filetype'}, },
  extensions = { 'quickfix' }
}
