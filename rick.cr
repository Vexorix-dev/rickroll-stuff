require "http/client"

def run_command
  output = `curl ascii.live/rick`
  
  if $?.exitstatus == 0
    puts output  # Print command output
  else
    puts "Command failed"
    open_rickroll
  end
end

def open_rickroll
  url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  
  if (Crystal::OS.windows?)
    `start #{url}`
  elsif (Crystal::OS.macos?)
    `open #{url}`
  else
    `xdg-open #{url}`  # Assume Linux
  end
end

run_command