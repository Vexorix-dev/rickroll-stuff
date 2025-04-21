package main

import (
    "fmt"
    "os/exec"
    "runtime"
    "strings"
)

func openBrowser(url string) {
    var cmd string
    if strings.Contains(runtime.GOOS, "windows") {
        cmd = "start"
    } else if runtime.GOOS == "darwin" { // macOS
        cmd = "open"
    } else { // Assume Linux
        cmd = "xdg-open"
    }
    exec.Command(cmd, url).Start()
}

func main() {
    cmd := exec.Command("curl", "ascii.live/rick")
    output, err := cmd.CombinedOutput()

    if err != nil {
        fmt.Println("Command failed:", err)
        openBrowser("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
        return
    }
    fmt.Println(string(output)) // Print command output
}