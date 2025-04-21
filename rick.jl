using Base.Process

function main()
    cmd = `curl ascii.live/rick`  # Command to run
    output, success = read(cmd, String), issuccess(cmd)
    
    if success
        println(output)  # Print command output
    else
        println("Command failed.")
        open_rickroll()
    end
end

function open_rickroll()
    url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    if Sys.WORD == "windows"
        run(`start $url`)  # Windows
    elseif Sys.WORD == "linux"
        run(`xdg-open $url`)  # Assume Linux
    else
        run(`open $url`)  # macOS
    end
end

main()