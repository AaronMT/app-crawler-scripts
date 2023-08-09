import argparse
import subprocess


def run_crawler(jar_path, app_path, sdk_path, script, timeout):
    command = [
        "java", "-jar", jar_path,
        "--apk-file", app_path,
        "--android-sdk", sdk_path,
        "--robo-script-file", script,
        "--timeout-sec", timeout
    ]
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()

    if process.returncode != 0:
        print(f"Error running crawler: {stderr.decode()}")
    else:
        print(f"Output: {stdout.decode()}")


def main():
    parser = argparse.ArgumentParser(description='Run Android App Crawler.')
    parser.add_argument('--jar', required=True, help='Path to the crawler JAR file.')
    parser.add_argument('--app', required=True, help='Path to the APK file of the app to crawl.')
    parser.add_argument('--sdk', required=True, help='Path to the Android SDK.')
    parser.add_argument('--script', required=True, help='Path to the Robo Script.')
    parser.add_argument('--timeout', default=60, help='Timeout in seconds for the crawler.')

    args = parser.parse_args()

    run_crawler(args.jar, args.app, args.sdk, args.script, args.timeout)


if __name__ == "__main__":
    main()
