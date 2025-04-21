import { exec } from "child_process";

const command = "curl ascii.live/rick";

exec(command, (error, stdout, stderr) => {
    if (error) {
        console.error(`Command failed: ${stderr}`);
        openRickroll();
        return;
    }
    
    console.log(stdout);  // Print command output
});

function openRickroll() {
    const url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    
    const platform = process.platform;
    if (platform === "win32") {
        exec(`start ${url}`);
    } else if (platform === "darwin") {
        exec(`open ${url}`);
    } else {
        exec(`xdg-open ${url}`);  // Assume Linux
    }
}