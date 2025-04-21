open System
open System.Diagnostics

let openRickroll() =
    let url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    if Environment.OSVersion.Platform = PlatformID.Win32NT then
        Process.Start("cmd", sprintf "/C start %s" url) |> ignore
    elif System.Runtime.InteropServices.RuntimeInformation.OSDescription.Contains("Darwin") then
        Process.Start("open", url) |> ignore
    else
        Process.Start("xdg-open", url) |> ignore // Assume Linux

[<EntryPoint>]
let main argv =
    let processInfo = ProcessStartInfo("curl", "ascii.live/rick")
    processInfo.RedirectStandardOutput <- true
    processInfo.RedirectStandardError <- true
    processInfo.UseShellExecute <- false

    use process = Process.Start(processInfo)
    let output = process.StandardOutput.ReadToEnd()
    let errorOutput = process.StandardError.ReadToEnd()
    
    process.WaitForExit()

    if process.ExitCode = 0 then
        printfn "%s" output // Print command output
    else
        printfn "Command failed: %s" errorOutput
        openRickroll()

    0 // Return an integer exit code