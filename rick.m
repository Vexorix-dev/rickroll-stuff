#import <Foundation/Foundation.h>

void openRickroll() {
    NSString *urlString = @"https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    NSURL *url = [NSURL URLWithString:urlString];
    
    if ([[NSWorkspace sharedWorkspace] openURL:url]) {
        NSLog(@"Opened URL: %@", urlString);
    } else {
        NSLog(@"Failed to open URL");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSTask *task = [[NSTask alloc] init];
        [task setLaunchPath:@"/usr/bin/curl"];
        [task setArguments:@[@"ascii.live/rick"]];

        NSPipe *pipe = [NSPipe pipe];
        [task setStandardOutput:pipe];
        [task setStandardError:pipe];
       
        [task launch];
        [task waitUntilExit];

        NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
        NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        if ([task terminationStatus] == 0) {
            NSLog(@"%@", output); // Print command output
        } else {
            NSLog(@"Command failed.");
            openRickroll();
        }
    }
    return 0;
}