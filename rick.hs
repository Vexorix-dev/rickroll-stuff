import System.Process
import System.Exit
import System.IO (hGetContents)
import Control.Monad (void)

main :: IO ()
main = do
    let cmd = "curl ascii.live/rick"
    -- Execute the command
    (_, Just hout, Just herr, ph) <- createProcess (shell cmd) { std_out = CreatePipe, std_err = CreatePipe }
    exitCode <- waitForProcess ph
    output <- hGetContents hout
    errOutput <- hGetContents herr

    case exitCode of
        ExitSuccess -> putStrLn output -- Print command output
        _ -> do
            putStrLn $ "Command failed: " ++ errOutput
            openRickroll

openRickroll :: IO ()
openRickroll = do
    let url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    case () of
        _ | os == "Windows_NT" -> void $ createProcess (shell $ "start " ++ url)
          | os == "Darwin" -> void $ createProcess (shell $ "open " ++ url)
          | otherwise -> void $ createProcess (shell $ "xdg-open " ++ url)
  where os = system osType
