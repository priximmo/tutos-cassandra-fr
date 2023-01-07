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

IP=$(hostname -I | awk '{print $2}')

# Functions ###################################################

install_prerequisites(){

# Swap off
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

# Disable THP
sudo /bin/bash -c 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
sudo sed -i s/"quiet splash"/"transparent_hugepage=never quiet splash"/g /etc/default/grub
sudo update-grub

# Set swappiness to 0
sudo /bin/bash -c 'echo vm.swappiness = 0 > /etc/sysctl.d/99-sysctl.conf'
sudo sysctl -p


}

clean_host(){
sed -i /'^127.0.2.1.*'/d /etc/hosts
}

install_cassandra(){
echo "deb https://debian.cassandra.apache.org 41x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
apt update -qq 2>&1 >/dev/null
apt install -y openjdk-11-jre-headless cassandra -qq 2>&1 >/dev/null
}

install_cluster(){
systemctl stop cassandra
sed -i s/"Test Cluster"/"Xavki"/g /etc/cassandra/cassandra.yaml
sed -i s/"listen_address:.*"/"listen_address: "${IP}/g /etc/cassandra/cassandra.yaml
sed -i s/"rpc_address:.*"/"rpc_address: "${IP}/g /etc/cassandra/cassandra.yaml
sed -i s/"127.0.0.1:7000"/"cassandra1:7000"/g /etc/cassandra/cassandra.yaml
systemctl start cassandra
}

install_jmx_exporter(){
sed -i s/"LOCAL_JMX=yes"/"LOCAL_JMX=no"/g /etc/cassandra/cassandra-env.sh
sed -i s/"authenticate=true"/"authenticate=false"/g /etc/cassandra/cassandra-env.sh
systemctl restart cassandra
wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.17.2/jmx_prometheus_javaagent-0.17.2.jar
mv jmx_prometheus_javaagent-0.17.2.jar /usr/share/cassandra/lib/
cp /vagrant/jmx-exporter.yaml /etc/cassandra/

echo '
JVM_OPTS="$JVM_OPTS -javaagent:$CASSANDRA_HOME/lib/jmx_prometheus_javaagent-0.17.2.jar=7070:/etc/cassandra/jmx-exporter.yaml"
' >> /etc/cassandra/cassandra-env.sh
systemctl restart cassandra
}

# Let's Go !! #################################################

install_prerequisites
clean_host
install_cassandra
install_cluster
if [[ "$1" == "yes" ]];then
  install_jmx_exporter
fi
