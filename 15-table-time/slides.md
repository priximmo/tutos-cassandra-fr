%title: CASSANDRA
%author: xavki


# CASSANDRA : Tables & timestamp & TTL


<br>
* création de la table

```
CREATE TABLE utilisateurs_par_ville ( alias text, nom text , ville text, PRIMARY KEY (alias,nom));
INSERT INTO utilisateurs_par_ville (alias, nom , ville ) VALUES ( 'xav', 'pierre', 'Paris');
INSERT INTO utilisateurs_par_ville (alias, nom , ville ) VALUES ( 'xavki', 'xavier', 'Paris');
INSERT INTO utilisateurs_par_ville (alias, nom , ville ) VALUES ( 'bob', 'paul', 'Lille');
```

<br>
* affichage de la date d'écriture d'une valeur (hors clef primaire)

```
SELECT alias,nom,ville, writetime(ville) FROM utilisateurs_par_ville ;
date -d @1594890691
UPDATE utilisateurs_par_ville SET ville = 'Caen' WHERE alias = 'xavki' AND nom = 'xavier';
SELECT alias,nom,ville, writetime(ville) FROM utilisateurs_par_ville ;
```

<br>
* TTL en secondes

```
UPDATE utilisateurs_par_ville USING TTL 10 SET ville = 'Paris' WHERE alias = 'xavki' AND nom = 'xavier';
```
