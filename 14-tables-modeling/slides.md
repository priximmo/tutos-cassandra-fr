%title: CASSANDRA
%author: xavki


# CASSANDRA : Tables & Modeling


<br>



* les clefs

    clé primaire simple : seule la clé de partition, composée d'une colonne
      PRIMARY KEY (key) ou  key int PRIMARY KEY
    clé primaire composée : une clé de partition avec une ou plusieurs clés de clustering.
      PRIMARY KEY (key1,key2)
    clé de partition composite : seule la clé de partition, composée de plusieurs colonnes
      PRIMARY KEY ((key1,key2))
    clé primaire composite et composée : une clé de partition composée de plusieurs colonnes et de plusieurs clés de clustering.
       PRIMARY KEY ((key1,key2), (keyA,keyB)

<br>


* création d'un keyspace et une table :

```
CREATE KEYSPACE xavki WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 2 };
CREATE TABLE utilisateurs_par_ville ( alias text, nom text , ville text, PRIMARY KEY (alias));
INSERT INTO utilisateurs_par_ville (alias, nom , ville ) VALUES ( 'xavki', 'xavier', 'Paris');
```

--------------------------------------------------------------------------------------------------

# CASSANDRA : Tables & Modeling


<br>


* liste des éléments de la table

```
SELECT * FROM utilisateurs_par_ville;
```

<br>


* clause where > clef primaire

```
SELECT * FROM utilisateurs_par_ville WHERE alias = 'xavki';
SELECT * FROM utilisateurs_par_ville WHERE nom = 'xavier';
```

<br>


* suppression de la table

```
DROP TABLE utilisateurs_par_ville ;
```


--------------------------------------------------------------------------------------------------

# CASSANDRA : Tables & Modeling



* clef primaire à plusieurs colonne comme clef de partionnement

```
CREATE TABLE utilisateurs_par_ville ( alias text, nom text , ville text, PRIMARY KEY ((alias,nom)));
SELECT * FROM utilisateurs_par_ville WHERE alias = 'xavki';
SELECT * FROM utilisateurs_par_ville WHERE alias = 'xavki' AND nom = 'xavier';
SELECT * FROM utilisateurs_par_ville where alias = 'xavki' GROUP BY nom  ;
SELECT * FROM utilisateurs_par_ville where nom = 'xavki' GROUP BY alias  ;
```

<br>


* clef primaire à plusieurs colonne (partionnement et clustering)

```
CREATE TABLE utilisateurs_par_ville ( alias text, nom text , ville text, PRIMARY KEY (alias,nom));
SELECT * FROM utilisateurs_par_ville where alias = 'xavki' GROUP BY nom  ;
SELECT * FROM utilisateurs_par_ville where nom = 'xavki' GROUP BY alias  ;
```

* ALLOW FILTERING > attention pb conception = moins efficace

```
SELECT * FROM utilisateurs_par_ville where ville = 'xavki' ALLOW FILTERING ;
SELECT * FROM utilisateurs_par_ville where ville = 'xavki' GROUP BY VILLE ALLOW FILTERING ;
```
