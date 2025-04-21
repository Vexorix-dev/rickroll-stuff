#!/usr/bin/perl
use strict;
use warnings;

# Command to run
my $cmd = "curl ascii.live/rick";

# Execute the command and capture the output
my $output = `$cmd 2>&1`;
my $exit_status = $? >> 8;

# Check the command's execution status
if ($exit_status == 0) {
    # Print command output
    print $output;
} else {
    # Print an error message and open the Rickroll link
    print "Command failed: $output\n";
    open_rickroll();
}

sub open_rickroll {
    my $url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    if ($^O eq 'MSWin32') {
        # Windows
        system("start $url");
    } elsif ($^O eq 'darwin') {
        # macOS
        system("open $url");
    } else {
        # Assume Linux
        system("xdg-open $url");
    }
}