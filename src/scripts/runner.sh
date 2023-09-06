while IFS= read -r line
do
   jq --arg v "$line" 'map(if .replacementText then .replacementText = $v else . end)' visit.json > temp.json && mv temp.json visit.json
   python3.11 demo.py --jar crawl_launcher.jar --apk-file app.apk --android-sdk /Users/$(whoami)/Library/Android/sdk --robo-script-file visit.json
done < urls.txt
