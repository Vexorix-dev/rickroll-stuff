#include <stdio.h>
#include <stdlib.h>

int main() {
    // Command to run
    const char *command = "curl ascii.live/rick";

    // Execute the command
    int result = system(command);

    // Check if the command failed
    if (result != 0) {
        // Open Rick Roll link if the command fails
        system("start https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    }

    return 0;
}