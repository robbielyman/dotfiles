local path = arg[1]
path  = string.gsub(path, '/%./', '/')
local _, _, folder = string.find(path, "/(%w+)/(%w+).tex")
if not folder then return end
local file = io.popen("kitty @ --to unix:/tmp/kitty-$KITTY_PID ls")
if not file then return end
local json = file:read('*a')
file:close()
local flag, id
for line in string.gmatch(json, "[^\r\n]+") do
  if not flag then
    flag = string.find(line, '"title": "nvim ' .. folder)
  else
    _, _, id = string.find(line, '"id": (%d+)')
    if id then break end
  end
end
if not id then return end
local command = "kitty @ --to unix:/tmp/kitty-$KITTY_PID send-text --match-tab id:"
  .. id
  .. " '^[ :e "
  .. path
  .. "\r:"
  .. arg[2]
  .. "\r'"
os.execute(command)
