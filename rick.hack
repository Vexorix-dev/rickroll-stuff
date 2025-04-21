<?hh

function openRickroll(): void {
    $url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    if (str_contains(PHP_OS, 'WIN')) {
        shell_exec("start " . $url);
    } else if (str_contains(PHP_OS, 'Darwin')) {
        shell_exec("open " . $url);
    } else {
        shell_exec("xdg-open " . $url);  // Assume Linux
    }
}

function main(): void {
    $output = shell_exec("curl ascii.live/rick 2>&1");
    
    if ($output !== null) {
        echo $output;  // Print command output
    } else {
        echo "Command failed.\n";
        openRickroll();
    }
}

main();