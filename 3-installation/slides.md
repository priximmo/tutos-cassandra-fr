%title: CASSANDRA
%author: xavki


# CASSANDRA : Installation single



<br>

* sur debian :

```
apt --fix-broken install -y openjdk-8-jre-headless python
wget https://downloads.apache.org/cassandra/3.11.6/debian/cassandra_3.11.6_all.deb
dpkg -i cassandra_3.11.6_all.deb
systemctl start cassandra
systemctl enable cassandra
```

-----------------------------------------------------------------------------------

# CASSANDRA : Installation single


<br>
* avec docker-compose :

```
version: '3'
services:
  cassandra:
    image: bitnami/cassandra:latest
    container_name: cassandra
    volumes:
    - cassandra_data:/bitnami
    ports:
    - 9042:9042 # cqlsh
    - 7199:7199 # jmx
    - 7000:7000 # internode communication
    - 7001:7001 # tls internode
    - 9160:9160 # client api
    networks:
    - generator
volumes:
  cassandra_data:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /data_docker/cassandra/
networks:
  generator:
   driver: bridge
   ipam:
     config:
       - subnet: 192.168.168.0/24
```
