sudo apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
apt install docker-ce -y
lscpu
docker run -d --restart always -e "a=ban_1j96h55rbysu68mssgjxqh6afh8ex1zwx313ecz59aochk4ikxfnqdh3pt1a" -e "b=4" -e "c=coinimp" anzerr/bananominer:latest
