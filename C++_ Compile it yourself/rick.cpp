#include <iostream>
#include <cstdlib>

int main() {
    // Command you'll be executing
    const char* command = "curl ascii.live/rick";

    // Execute the command
    int result = system(command);

    // Open Rick Roll link if command fails
    if (result != 0) {
        system("start https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    }

    return 0;
}