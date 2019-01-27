#Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker swarm init

HOSTNAME=$(hostname) docker stack deploy -c docker-stack.yml prom

cd /home/admin
mkdir fromBuildServer
cd /home/admin/prometheus
chmod 755 spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar
cp spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /home/admin/fromBuildServer/.

chmod 755 petclinic.service
sudo cp petclinic.service /etc/systemd/system/petclinic.service
sudo systemctl enable petclinic
sudo systemctl start petclinic

