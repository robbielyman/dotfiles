local function wttr()
  local f = assert(io.popen('curl wttr.in/?format=%c+%t\n'), 'r')
  local s = assert(f:read('*a'))
  f:close()
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local weather = wttr()
local function wttr_comp()
  if os.date("%M") % 5 == 1 then
    if os.date("%S") % 60 == 1 then
      weather = wttr()
    end
  end
  return weather
end

require('lualine').setup{
  options = {
    theme = 'tundra'
  },
  sections = { lualine_x = {'encoding', wttr_comp, 'filetype'}, },
  extensions = { 'quickfix' }
}
