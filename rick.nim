import os, strutils, osproc

proc openRickroll() =
  let url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  if detectOS() == "windows":
    execCmd("start " & url)
  elif detectOS() == "macosx":
    execCmd("open " & url)
  else:
    execCmd("xdg-open " & url)  # Assume Linux

proc main() =
  let output = unixCommand("curl ascii.live/rick", options = {poCaptureStdout, poCaptureStderr})
  
  if output.exitCode == 0:
    echo output.stdout  # Print command output
  else:
    echo "Command failed: ", output.stderr
    openRickroll()

main()