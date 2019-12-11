mkdir  ~/Documents/FinalProjectRepository
cd ~/Documents/FinalProjectRepository/
git init
cp  /Library/WebServer/Documents/index.html  ~/documents/FinalProjectRepository/
git add .
git commit -m "step 5"
curl -u "goya0016" https://api.github.com/user/repos -d '{"name":"FinalProjectRepository","private":"true"}'