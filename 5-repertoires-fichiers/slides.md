%title: CASSANDRA
%author: xavki


# CASSANDRA : Répertoires et Fichiers


<br>
* /etc/init.d/cassandra

```
NAME=cassandra
PIDFILE=/var/run/$NAME/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
CONFDIR=/etc/cassandra
WAIT_FOR_START=10
CASSANDRA_HOME=/usr/share/cassandra
CASSANDRA_CONF=$CONFDIR
FD_LIMIT=100000
```

<br>
* /etc/cassandra/cassandra.yml : configuration de base
		* cluster_name			: nom du cluster (important pour le rattachement)
		* listen_address		: ip d'écoute (défaut localhost)
		* listen_interfaces	: remplacement du listen_address par l'interface

<br>
* /etc/cassandra/jvm.options : paramètres de la jvm
		* Xms/Xmx
		* Garbage Collector
		* ports par défaut

-----------------------------------------------------------------------

# CASSANDRA : Répertoires et Fichiers


<br> 
* /var/lib/cassandra/ : répertoires de datas
		* data/ 				: les datafiles > SSTAbles
		* commitlogs/		: fichiers de transactions (recovery)
		* saved_caches/ : sauvegarde des keys et rows en cache

<br>
* les binaires principaux : répertoires bin/ (dépend de l'installation)
		* cassandra 				: binaire principal
		* cqlsh 						: client utilisant le langage cql
		* nodetool 					: tâches de maintenance et d'administration

<br>
* autres binaires :
		* cassandra-stress 	: outil de bench
		* sstableXXX

<br>
* /usr/share/cassandra/lib/ : librairies 
		* json-simple-1.1.jar
		* metrics-jvm-3.1.5.jar
		
-----------------------------------------------------------------------

# CASSANDRA : Répertoires et Fichiers


<br>
* autres fichiers 
		* /etc/cassandra/cassandra-rackdc.properties 		: conf snitch GossipingPropertyFileSnitch
		* /etc/cassandra/cassandra-topology.properties 	: topology rack/dc
		* /etc/cassandra/commitlog_archiving.properties	: conf des commitlogs (format...)
		* /etc/cassandra/cassandra-env.sh : calcul des variables JAVA/JVM
		* /etc/cassandra/logback.xml : format de logs et conf
