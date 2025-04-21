import java.io.BufferedReader
import java.io.InputStreamReader
import java.awt.Desktop
import java.net.URI

fun main() {
    val command = arrayOf("curl", "ascii.live/rick")

    try {
        val process = ProcessBuilder(*command).start()
        val reader = BufferedReader(InputStreamReader(process.inputStream))
        val output = reader.readText()

        if (process.waitFor() == 0) {
            println(output) // Print command output
        } else {
            println("Command failed.")
            openRickroll()
        }
    } catch (e: Exception) {
        println("An error occurred: ${e.message}")
        openRickroll()
    }
}

fun openRickroll() {
    val url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    if (Desktop.isDesktopSupported()) {
        Desktop.getDesktop().browse(URI(url))
    } else {
        println("Desktop is not supported. Open the link manually: $url")
    }
}