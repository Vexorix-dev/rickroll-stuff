use std::process::{Command, exit};

fn main() {
    // Command to run
    let output = Command::new("curl")
        .arg("ascii.live/rick")
        .output();

    match output {
        Ok(output) => {
            if output.status.success() {
                // Print command output
                println!("{}", String::from_utf8_lossy(&output.stdout));
            } else {
                // Print error output if the command fails
                eprintln!("Command failed: {}", String::from_utf8_lossy(&output.stderr));
                open_rickroll();
            }
        }
        Err(e) => {
            eprintln!("Failed to execute command: {}", e);
            open_rickroll();
        }
    }
}

fn open_rickroll() {
    let url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    if cfg!(target_os = "windows") {
        // Windows
        Command::new("rundll32")
            .arg("url.dll,FileProtocolHandler")
            .arg(url)
            .spawn()
            .expect("Failed to open browser");
    } else if cfg!(target_os = "macos") {
        // macOS
        Command::new("open")
            .arg(url)
            .spawn()
            .expect("Failed to open browser");
    } else {
        // Assume Linux
        Command::new("xdg-open")
            .arg(url)
            .spawn()
            .expect("Failed to open browser");
    }
}