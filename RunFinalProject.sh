mkdir  ~/Documents/FinalProjectRepository
cd ~/Documents/FinalProjectRepository/
git init
cp  /Library/WebServer/Documents/index.html  ~/documents/FinalProjectRepository/
git add .
git commit -m "step 5"
curl -u "goya0016" https://api.github.com/user/repos -d '{"name":"FinalProjectRepository","private":"true"}'
git push --set-upstream https://github.com/goya0016/FinalProjectRepository.git master

ssh goya0016@52.149.186.16 'git clone https://www.github.com/goya0016/FinalProjectRepository.git; cd FinalProjectRepository;cd FinalProjectRepository;rm -rf .git;sudo mv FinalProjectRepository/ /var/www/html;sudo systemctl start nginx'

open -a safari http://goya0016.hopto.org/
/Users/nipungoyal/Library/Android/sdk/emulator/emulator -avd Nexus_10_API_25 &
cd ~/Library/Android/sdk/platform-tools/
./adb start-server
./adb shell am start -a android.intent.action.VIEW -d http://goya0016.hopto.org/

cd ~/Documents/FinalProjectRepository/
echo "FROM ubuntu:18.04">>Dockerfile
echo "RUN apt update">>Dockerfile
echo "RUN apt install -y nginx && apt install -y unzip">>Dockerfile
echo "COPY Archive.zip  /var/www/html">>Dockerfile
echo "RUN unzip Archive.zip">>Dockerfile
echo "CMD ["/usr/sbin/nginx", "-g" , "daemon off;"]">>Dockerfile
echo "EXPOSE 80">>Dockerfile
docker build . -t myserver:v1
docker run -p 12345:80 myserver:v1