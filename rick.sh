#!/bin/bash

# Command to run
cmd="curl ascii.live/rick"

# Execute the command and capture the output
output=$($cmd 2>&1)

# Check the exit status
if [ $? -eq 0 ]; then
    echo "$output"  # Print command output
else
    echo "Command failed: $output"
    # Open Rickroll link
    xdg-open "https://www.youtube.com/watch?v=dQw4w9WgXcQ" 2>/dev/null || \
    start "https://www.youtube.com/watch?v=dQw4w9WgXcQ" || \
    open "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
fi