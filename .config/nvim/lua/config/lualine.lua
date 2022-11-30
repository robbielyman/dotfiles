local function wttr()
    local f = assert(io.popen('curl wttr.in/?format=%c+%t\n'), 'r')
    local s = assert(f:read('*a'))
    f:close()
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

local weather = nil
local minutes = tonumber(os.date("%M"))
local function wttr_comp()
    local checkminutes = tonumber(os.date("%M"))
    if (60 + checkminutes - minutes) % 60 >= 1 then
        minutes = checkminutes
        weather = wttr()
    end
    return weather
end

require('lualine').setup{
    options = {
        theme = 'tundra'
    },
    sections = { lualine_x = {'encoding', 'fileformat', 'filetype'}, },
    extensions = { 'quickfix' }
}
