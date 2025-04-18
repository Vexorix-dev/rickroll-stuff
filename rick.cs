class Program
{
    static void Main()
    {
        // Command to execute
        string command = "curl ascii.live/rick";

        // Execute command via command prompt
        string result = ExecuteCommand(command);

        // If the command output is null or empty, we assume failure
        if (string.IsNullOrEmpty(result))
        {
            // Open the YouTube link
            ExecuteCommand("start https://www.youtube.com/watch?v=dQw4w9WgXcQ");
        }
        else
        {
            // If the command succeeds, you can print the output
            System.Console.WriteLine(result);
        }
    }

    static string ExecuteCommand(string command)
    {
        // Prepare the process
        System.Diagnostics.Process process = new System.Diagnostics.Process();
        process.StartInfo.FileName = "cmd.exe";
        process.StartInfo.Arguments = "/C " + command; // Execute the command and close
        process.StartInfo.RedirectStandardOutput = true; // Capture output
        process.StartInfo.UseShellExecute = false; // Don't use shell to execute

        // Start the process
        process.Start();
        string output = process.StandardOutput.ReadToEnd(); // Read command output
        process.WaitForExit(); // Wait for the process to complete

        return output; // Return the output of the executed command
    }
}