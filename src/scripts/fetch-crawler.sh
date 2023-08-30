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

  # Extract the zip file to the current directory
  echo "Extracting zip file..."
  unzip "$output_file"
  echo "Extraction completed."

  # Move the contents of the app-crawler folder to the current directory
  echo "Moving contents of app-crawler folder to current directory..."
  mv app-crawler/* .
  echo "Moved contents of app-crawler folder to current directory."

  # Remove the app-crawler folder
  echo "Removing app-crawler folder..."
  rmdir app-crawler
  echo "Removed app-crawler folder."
else
  echo "URL does not exist: $url"
fi
