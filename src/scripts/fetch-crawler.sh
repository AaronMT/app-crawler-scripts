#!/usr/bin/env sh

# URL to fetch
url="https://dl.google.com/appcrawler/beta1/app-crawler.zip"

# Output file
output_file="crawl_launcher.jar"

# Use curl to fetch the URL and write the output to the file
if curl --output /dev/null --silent --head --fail "$url"; then
  echo "URL exists: $url"
  echo "Downloading file..."
  curl --silent --location --output "$output_file" "$url"
  echo "Download completed. File saved as $output_file"
else
  echo "URL does not exist: $url"
fi
