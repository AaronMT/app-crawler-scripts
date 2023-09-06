Requirements: 
* Java environment
* Android SDK
* Android device with USB debugging enabled

If Android Studio installed, you can make use of the bundled Android SDK and Java environment.

On MacOS: `export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home`

1. Connect your Android device to your computer via USB and authorize it for development (via prompt).
2. Run the fetch-apk.sh script to download the latest Fenix debug APK from your device to your computer.
3. Run the crawler_app.sh script to fetch the App Crawler binary from Google.

## Demo

`usage: demo.py [-h] --jar JAR --apk-file APK_FILE --android-sdk ANDROID_SDK --robo-script-file ROBO_SCRIPT_FILE [--timeout-sec TIMEOUT_SEC]`

E.g, `% python3.11 demo.py --jar crawl_launcher.jar --apk-file app.apk --android-sdk /users/aaronmt/Library/Android/sdk`

or supplying a Robo Script file:

E.g, `% python3.11 demo.py --jar crawl_launcher.jar --apk-file app.apk --android-sdk /users/aaronmt/Library/Android/sdk --robo-script-file visit.json`

App Crawler will run for the specified timeout (default 60 seconds) and then terminate. The output will be saved to the `crawl_output` directory.

App Crawler will terminate if a crash is found, or if the app is not responding.

Example output: 
```
Output: Preparing to crawl org.mozilla.fenix.debug
Crawl started.
Crawl finished.
Writing logcat to /Users/aaronmt/Mozilla/app-crawler-scripts/src/scripts/crawl_output/org.mozilla.fenix.debug-logcat.txt
WARNING: Found 57 usages of non-SDK API methods. See Logcat for details.
SUCCESS: Found 0 crashes.
Converting output files
The output directory is /Users/aaronmt/Mozilla/app-crawler-scripts/src/scripts/crawl_output
```

# Links
* https://developer.android.com/studio/test/other-testing-tools/app-crawler