%title: CASSANDRA
%author: xavki


# CASSANDRA : CQL, premières commandes


<br>


* keyspaces (databases/schema) : conteneur de tables / objets
		* replication factor
		* strategie de réplication / SimpleStrategy (NetworkTopologyStrategy)


<br>


* tables : mise en forme des données lignes/colonnes - create/drop/alter/insert

<br>


* colonnes (champs) : caractéristiques d'une lignes avec un type (int, text...)


------------------------------------------------------------------------------------


# CASSANDRA : CQL, premières commandes


<br>


* création d'un keyspace

```
DESCRIBE KEYSPACES;
CREATE KEYSPACE myks WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2 };
DESCRIBE KEYSPACE myks ;
```

PS : CREATE KEYSPACE IF NOT EXISTS

<br>



* création d'une table

```
USE myks;
CREATE TABLE mytb (id int PRIMARY KEY, name text);
DESCRIBE TABLES

```

<br>


* insertion de données

```
DESCRIBE TABLES;
INSERT INTO mytb (id, name) VALUES (1, 'xavier');
INSERT INTO mytb (id, name) VALUES (2, 'pierre');
```

<br>


* requête

```
SELECT * FROM mytb;
```
