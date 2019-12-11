mkdir  ~/Documents/FinalProjectRepository
cd ~/Documents/FinalProjectRepository/
git init
cp  /Library/WebServer/Documents/index.html  ~/documents/FinalProjectRepository/
git add .
git commit -m "step 5"
curl -u "goya0016" https://api.github.com/user/repos -d '{"name":"FinalProjectRepository","private":"true"}'
git push --set-upstream https://github.com/goya0016/FinalProjectRepository.git master
ssh goya0016@52.149.186.16
git clone https://github.com/goya0016/FinalProjectRepository.git
cd FinalProjectRepository
rm -rf .git
sudo mv FinalProjectRepository/ /var/www/html
sudo systemctl start nginx