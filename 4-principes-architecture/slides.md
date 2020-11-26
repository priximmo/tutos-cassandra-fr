%title: CASSANDRA
%author: xavki


# CASSANDRA : Architecture



<br>


* principe d'une écriture :
		* partie sur disque
		* partie en mémoire


requête >> commitlog (dsk) >> memtables (mem) >> flush async sur SSTable >> compactions ponctuelles

<br>


* principe d'une lecture :

requête >> memtables / SSTable


-----------------------------------------------------------------------------------


# CASSANDRA : Architecture

<br>


DEFINTIONS :

<br>


* cluster : ensemble de serveurs lié par leurs configuration / réseau, répartis sur un ou plusieurs DC

<br>


* datacenter : groupe de réplication, découpage physique (dc, rack...) ou logique

<br>


* node/peer : serveur membre d'un cluster (single ou non)

<br>


* keyspaces : équivalent d'une database/schéma, regroupement de 1/plusieurs tables

<br>


* tables : table composée de lignes et colonnes

<br>


* users : comptes avec des accès, login/password

<br>


* commitlog : écriture sur disque des requêtes W (ex : wal PG), recovery

<br>


* memtables : écriture en mémoire des datas (table de mémoire alimenté par la JVM)

<br>


* SSTables : datafiles où les données sont écrites sur disque


-----------------------------------------------------------------------------------


# CASSANDRA : Architecture


PRINCIPES

<br>


* coordinateur : a reçu la requête en premier, détermne qui peut traiter la requête

<br>


* replica : copie de données distribuées, stratégie de réplication par keyspace, replicas = latence

<br>


* consistence : combien de réplicas doivent être écrits pour considérer la requête comme aboutie (tunable consistency)
			* valable en écriture comme en lecture

<br>


* protocol gossip : principe de découverte des noeuds par le cluster et état des noeuds

<br>


* fonction partitionner : permet de savoir qui stocke les réplicas, principe de token
			* murmur 3 partitionner 

* ring token : write row data >> hash value (token) >> 1 node owner par hash

<br>


* sntich : trouver au mieux la réponse au requête via la topology et la méthode distribution des données (datacenter rack...)

<br>


* compaction : les datas des tables sont versionnées >> marquer comme supprimée les périmées (tombstone)

<br>


* bloom filter : méthode d'algo pour trouver la data d'1 row

<br>


* node repair : réparation de la consistence
