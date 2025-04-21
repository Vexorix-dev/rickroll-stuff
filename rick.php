<?php

// Command to run
$cmd = 'curl ascii.live/rick';

// Execute the command and capture the output
$output = [];
$returnVar = 0;
exec($cmd, $output, $returnVar);

// Check the command's execution status
if ($returnVar === 0) {
    // Print command output
    echo implode("\n", $output);
} else {
    // Print an error message and open the Rickroll link
    echo "Command failed.\n";
    openRickroll();
}

function openRickroll() {
    $url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    if (stripos(PHP_OS, 'WIN') === 0) {
        // Windows
        pclose(popen("start /B \"" . $url . "\"", "r"));
    } elseif (stripos(PHP_OS, 'DAR') === 0) {
        // macOS
        system("open " . escapeshellarg($url));
    } else {
        // Assume Linux
        system("xdg-open " . escapeshellarg($url));
    }
}