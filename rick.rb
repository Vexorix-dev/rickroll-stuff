require 'open3'

# Command to run
cmd = "curl ascii.live/rick"

# Execute the command
stdout, stderr, status = Open3.capture3(cmd)

# Check if the command was successful
if status.success?
  puts stdout
else
  # Open rickroll link if the command fails
  system("start https://www.youtube.com/watch?v=dQw4w9WgXcQ")
end