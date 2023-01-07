#!/usr/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Xavier
#  VERSION: 
#  CREATION:  
#  MODIFIE: 
#
#  DESCRIPTION: 
###############################################################



# Variables ###################################################



# Functions ###################################################

install_benthos(){
  curl -Lsf https://sh.benthos.dev | bash 2>&1 >/dev/null
}

install_docker(){
curl -fsSL https://get.docker.com -o get-docker.sh 2>&1 >/dev/null
chmod +x get-docker.sh
./get-docker.sh 2>&1 >/dev/null
usermod -aG docker vagrant
curl -fsSL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 2>&1 >/dev/null
chmod +x /usr/local/bin/docker-compose
}

launch_cassandra_exporter(){
docker-compose -f /vagrant/docker-compose.yml up -d
}

install_cassandra_tool(){
apt install -y python3-pip
pip3 install cqlsh
cqlsh cassandra1 -e "CREATE KEYSPACE IF NOT EXISTS xavki WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 2} ;"
cqlsh cassandra1 -e "CREATE TABLE IF NOT EXISTS xavki.T1 ( uid varchar PRIMARY KEY, text varchar );"
}

benthos_sample_config(){
echo "
input:
  generate:
    count: 1000000
    interval: ''
    mapping: |
      root.id = uuid_v4()
      root.message = \"Je suis un message \" + random_int().string()

output:
  cassandra:
    addresses:
      - cassandra1:9042
      - cassandra2:9042
      - cassandra3:9042
    query: 'INSERT INTO xavki.T1 (uid, text) VALUES (?, ?)'
    args_mapping: |
      root = [
        this.id,
        this.message,
      ]
" >/home/vagrant/cassandra_sample.yml
}

# Let's Go !! #################################################

install_benthos
install_docker
if [[ "$1" == "yes" ]];then
  launch_cassandra_exporter
fi
install_cassandra_tool
benthos_sample_config
