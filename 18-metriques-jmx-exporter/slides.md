%title: Cassandra
%author: xavki


# CASSANDRA : Métriques - JMX & Exporter

<br>


sed -i s/"LOCAL_JMX=yes"/"LOCAL_JMX=no"/g /etc/cassandra/cassandra-env.sh
sed -i s/"authenticate=true"/"authenticate=false"/g /etc/cassandra/cassandra-env.sh



wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.17.2/jmx_prometheus_javaagent-0.17.2.jar
mv jmx_prometheus_javaagent-0.17.2.jar /usr/share/cassandra/lib/



echo '
JVM_OPTS="$JVM_OPTS -javaagent:$CASSANDRA_HOME/lib/jmx_prometheus_javaagent-0.17.2.jar=7070:/etc/cassandra/jmx-exporter.yaml"
' >> /etc/cassandra/cassandra-env.sh
sudo systemctl restart cassandra




curl -fsSL https://get.docker.com -o get-docker.sh 2>&1 >/dev/null
chmod +x get-docker.sh
./get-docker.sh 2>&1 >/dev/null
usermod -aG docker vagrant
curl -fsSL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 2>&1 >/dev/null
chmod +x /usr/local/bin/docker-compose




version: '3'
services:
  cassandra_exporter:
    image: criteord/cassandra_exporter:2.3.8
    ports:
    - 9091:9091
    environment:
    - CASSANDRA_EXPORTER_CONFIG_host=192.168.12.100:7199
    - CASSANDRA_EXPORTER_CONFIG_listenPort=9091


docker-compose -f /vagrant/docker-compose.yml up -d


sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y wget unzip prometheus >/dev/null


echo "
global:
  scrape_interval:     5s 
  evaluation_interval: 5s 
  external_labels:
    youtube: 'xavki'
rule_files:
scrape_configs:
  - job_name: node_exporter
    static_configs:
      - targets: 
" > /etc/prometheus/prometheus.yml
awk '$1 ~ "^192.168" {print "        - "$2":9100"'} /etc/hosts >> /etc/prometheus/prometheus.yml
echo "
  - job_name: cassandra_exporter
    static_configs:
      - targets: 
        - localhost:9091
" >> /etc/prometheus/prometheus.yml


sudo systemctl restart prometheus
sudo systemctl enable prometheus

sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y grafana >/dev/null

sudo systemctl start grafana-server
sudo systemctl enable grafana-server

https://raw.githubusercontent.com/criteo/cassandra_exporter/master/grafana/cassandra_default.json


