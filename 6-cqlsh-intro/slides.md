%title: CASSANDRA
%author: xavki


# CASSANDRA : CQLSH

<br>


* nodetool

```
nodetool status
nodetool info
```

* version

```
cassandra -v
cqlsh -e "SHOW version;"
nodetool version
```

<br>


* CQLSH = client de connexion à un moteur cassandra

* CQLSH = python (installation de python > prérequis)

<br>


* configuration via le fichier cqlshrc > $CASSANDRA_HOME/conf/cqlshrc.sample

```
cqlsh --cqlshrc <file>
```

* configuration du client
		* ip par défaut
		* port
		* user, tls...

<br>


* historique :
		* $HOME/.cassandra/cqlsh_history
		* nodetool.history

--------------------------------------------------------------------------------


# CASSANDRA : CQLSH


<br>


* de base :

```
cqlsh <ip> <port>
```

<br>


* quelques options :
		* -h : help
		* -C : mode couleur
		* -u : utilisateur
		* -p : password
		* -k : keyspace
		* -f : commandes via un fichier cql
		* -e : cql via la ligne de commande bash
		* --debug : mode debug

<br>


* les mots clefs principaux :
		* SHOW : lister les objets
		* DESCRIBE : détailler un objet
		* USE : utiliser un objet
		* CREATE/UPDATE/DELETE/INSERT
