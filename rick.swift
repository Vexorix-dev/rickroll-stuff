import Foundation

let command = "curl ascii.live/rick"

// Function to open the Rickroll URL
func openRickroll() {
    let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!

    if NSWorkspace.shared.urlForApplication(toOpen: url) != nil {
        NSWorkspace.shared.open(url)
    } else {
        print("Failed to open browser.")
    }
}

// Execute the command
let task = Process()
task.launchPath = "/bin/zsh"
task.arguments = ["-c", command]

let pipe = Pipe()
task.standardOutput = pipe
task.standardError = pipe

task.launch()

let data = pipe.fileHandleForReading.readDataToEndOfFile()
task.waitUntilExit()

let output = String(data: data, encoding: .utf8) ?? ""
let exitStatus = task.terminationStatus

if exitStatus == 0 {
    print(output)  // Print command output
} else {
    print("Command failed: \(output)")
    openRickroll()
}