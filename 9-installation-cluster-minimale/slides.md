%title: CASSANDRA
%author: xavki


# CASSANDRA : Mise en place du cluster / Changement de nom du cluster


<br>
* nosql distribué = cluster facile à mettre en place (cf elasticsearch également)

* attention : installation par défaut > listen sur 127.0.0.1/localhost

<br>
* peu recommandé de listen sur 0.0.0.0

<br>
* modification du seed provider

<br>
* penser aux ouvertures de ports si nécessaires :
		* 9042 : client cqlsh
		* 9160 : protocol Thrift, ancien mode de communicaiton
		* 7000 : communication entre les noeuds
		* 7001 : com internode TLS
		* 7199 : monitoring JMX

* configuration du cluster/nodes

```
/etc/cassandra/cassandra.yml
```



-----------------------------------------------------------------------------

# CASSANDRA : Mise en place du cluster / Changement de nom


<br>
* changement de nom de cluster après premier démarrage

* option 1 : via la conf de fichiers

```
sudo service cassandra stop
sudo rm -rf /var/lib/cassandra/data/system/*
sudo vi /etc/cassandra/cassandra.yaml, setup the proper parameters
sudo service cassandra start
nodetool status
```

<br>
* option 2 ! via le cqlsh

```
cqlsh> UPDATE system.local SET cluster_name = 'test' where key='local';
nodetool flush (system)
vim /etc/cassandra/cassandra.yml
```
