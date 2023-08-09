#!/bin/zsh

# URL to fetch
url="https://firefox-ci-tc.services.mozilla.com/api/index/v1/task/mobile.v3.firefox-android.apks.fenix-android-test-debug.latest.noarch/artifacts/public%2Fbuild%2Ftarget.noarch.apk"

# Output file
output_file="app.apk"

# Use curl to fetch the URL and write the output to the file
if curl --output /dev/null --silent --head --fail "$url"; then
  echo "URL exists: $url"
  echo "Downloading file..."
  curl --silent --output "$output_file" "$url"
  echo "Download completed. File saved as $output_file"
else
  echo "URL does not exist: $url"
fi