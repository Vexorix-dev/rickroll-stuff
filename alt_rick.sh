#!/bin/sh

# Command to run
cmd="curl ascii.live/rick"

# Execute the command and capture the output
output=$($cmd 2>&1)
status=$?

# Check the command's exit status
if [ $status -eq 0 ]; then
    echo "$output"  # Print command output
else
    echo "Command failed: $output"
    open_rickroll
fi

open_rickroll() {
    url="https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    case $(uname) in
        Darwin) 
            # macOS
            open "$url"
            ;;
        Linux)
            # Assume Linux
            xdg-open "$url"
            ;;
        *CYGWIN*|*MINGW*)
            # Windows
            start "$url"
            ;;
        *)
            echo "Unsupported OS"
            ;;
    esac
}