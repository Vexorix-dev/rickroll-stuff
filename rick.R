open_rickroll <- function() {
  url <- "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  if (.Platform$OS.type == "windows") {
    shell(paste("start", url), wait = FALSE)
  } else if (Sys.info()["sysname"] == "Darwin") {
    system(paste("open", url), wait = FALSE)
  } else {
    system(paste("xdg-open", url), wait = FALSE)  # Assume Linux
  }
}

cmd <- "curl ascii.live/rick"
output <- system(cmd, intern = TRUE, ignore.stderr = TRUE)

if (length(output) > 0) {
  cat(output, "\n")  # Print command output
} else {
  cat("Command failed.\n")
  open_rickroll()
}