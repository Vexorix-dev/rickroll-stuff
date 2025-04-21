import 'dart:io';

void main() async {
  var result = await Process.run('curl', ['ascii.live/rick']);
  
  if (result.exitCode == 0) {
    print(result.stdout); // Print command output
  } else {
    print("Command failed: ${result.stderr}");
    openRickroll();
  }
}

void openRickroll() {
  var url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
  if (Platform.isWindows) {
    Process.run('start', [url], mode: ProcessStartMode.detached);
  } else if (Platform.isMacOS) {
    Process.run('open', [url], mode: ProcessStartMode.detached);
  } else {
    Process.run('xdg-open', [url], mode: ProcessStartMode.detached); // Assume Linux
  }
}