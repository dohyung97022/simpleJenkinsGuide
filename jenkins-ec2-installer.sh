# 업데이트
sudo apt update
sudo apt -y upgrade

# jdk 설치
sudo apt -y install openjdk-8-jdk

# jenkins 설치
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
sudo apt update
sudo apt install jenkins -y

# jenkins 시작
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

# jenkins 비밀번호 표시
echo the password for jenkins is :
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# 아이피, 포트번호 표시
curl http://checkip.amazonaws.com
echo port :8080

# 1. jenkins 회원가입

# 2. publish over ssh 플러그인 설치

# 3. global tool configuration -> add gradle -> download from website 설정

# 4. Manage Jenkins -> Manage Plugins -> Advanced Tab -> Scroll Down -> Check Now 클릭

# 5. 시스템 설정 -> publish over ssh -> SSH servers -> user password authetication -> key -> worker ec2 pem key 입력

# 6. 위 SSH servers  name=아무거나, hostname=worker-ip username=ubuntu -> test 클릭 -> 통과

# 7. 이후 https://www.youtube.com/watch?v=rwbN6JjDCXo 를 따라합니다. build 만 mvn 이 아니라 gradle 의 build 로 지정합니다.

# aws ubuntu 의 경우 exec command가 /home/ubuntu 시작합니다.
# jenkins workspace 의 경우 master ec2의 /var/lib/jenkins/workspace/ 입니다. 파일 트렌스퍼는 workspace/파일명 에서 시작
# https://ocblog.tistory.com/77 참고
# build 에 위에서 설정한 gradle version 과 clean build 를 설정한다.
# 해당 github repo 에 settings -> webhook 에 http://jenkinsIpAddress:8080/github-webhook/ 과 application/json 설정한다.
# ec2 micro 에서 jenkins build 가 느린 이유 https://stackoverflow.com/questions/57991172/aws-ec2-t2-micro-unlimited-jenkins-maven-very-slow-build-hangs