local handle = io.popen("curl ascii.live/rick")
local result = handle:read("*a")
local success = handle:close()

if success then
    print(result)  -- Print command output
else
    print("Command failed")
    open_rickroll()
end

function open_rickroll()
    local url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    local os_type = os.getenv("OS")

    if os_type == "Windows_NT" then
        os.execute("start " .. url)  -- Windows
    elseif package.config:sub(1, 1) == '\\' then
        os.execute("open .. " .. url)  -- macOS
    else
        os.execute("xdg-open " .. url)  -- Assume Linux
    end
end