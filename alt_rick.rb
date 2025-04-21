# Command to run
cmd = "curl ascii.live/rick"

# Execute the command and capture the output and error
output = `#{cmd} 2>&1`
status = $?.exitstatus

# Check the command's execution status
if status == 0
  puts output  # Print command output
else
  puts "Command failed: #{output}"
  open_rickroll
end

def open_rickroll
  url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  if Gem.win_platform?
    # Windows
    system("start #{url}")
  elsif RUBY_PLATFORM.include?("darwin")
    # macOS
    system("open #{url}")
  else
    # Assume Linux
    system("xdg-open #{url}")
  end
end