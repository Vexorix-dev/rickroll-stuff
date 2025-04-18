import subprocess
import webbrowser

def execute_command():
    try:
        result = subprocess.run(["curl", "ascii.live/rick"], check=True, text=True, capture_output=True)
        print("Command executed successfully:")
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Command failed to execute.")
        print(f"Error message: {e.stderr}")
        webbrowser.open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")

execute_command()
