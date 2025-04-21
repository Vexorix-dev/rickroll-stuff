import sys.process._
import scala.sys.exit

object Rickroll {
  def main(args: Array[String]): Unit = {
    val command = "curl ascii.live/rick"
    val output = command.!

    if (output == 0) {
      println("Command succeeded!")
    } else {
      println("Command failed")
      openRickroll()
    }
  }

  def openRickroll(): Unit = {
    val url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    val os = System.getProperty("os.name").toLowerCase

    if (os.contains("win")) {
      "cmd /c start " + url !;
    } else if (os.contains("mac")) {
      "open " + url !;
    } else {
      "xdg-open " + url !; // Assume Linux
    }
  }
}