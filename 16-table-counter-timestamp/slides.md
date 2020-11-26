%title: CASSANDRA
%author: xavki


# CASSANDRA : Counter & Unique ID


<br>


* counter = calcul sur la valeur précédente

```
CREATE TABLE utilisateurs_par_ville ( alias text , nom text , ville text , visites counter , PRIMARY KEY (alias,nom,ville));
UPDATE utilisateurs_par_ville SET visites = visites + 1 WHERE alias = 'xavki' AND nom = 'xavier' AND ville = 'Paris';
UPDATE utilisateurs_par_ville SET visites = visites + 1 WHERE alias = 'xavki' AND nom = 'xavier' AND ville = 'Paris';
UPDATE utilisateurs_par_ville SET visites = visites + 1 WHERE alias = 'xavki' AND nom = 'xavier' AND ville = 'Paris';
SELECT * FROM utilisateurs_par_ville;
```

<br>


* timestamp

```
CREATE TABLE utilisateurs_par_ville ( alias text , nom text , ville text , date_maj timestamp , PRIMARY KEY (alias));
INSERT INTO utilisateurs_par_ville (alias , nom , ville , date_maj) VALUES ( 'xavki', 'xavier', 'Caen', dateof(now()));
```

------------------------------------------------------------------

# CASSANDRA : Counter & Unique ID

<br>


* uuid

```
CREATE TABLE utilisateurs_par_ville ( alias text , nom text , ville text , id uuid , PRIMARY KEY (id));
INSERT INTO utilisateurs_par_ville (alias , nom , ville , id) VALUES ( 'xavki', 'xavier', 'Caen', uuid());
```

<br>


* timeuuid

```
CREATE TABLE utilisateurs_par_ville ( alias text , nom text , ville text , timeid timeuuid , PRIMARY KEY (timeid));
INSERT INTO utilisateurs_par_ville (alias , nom , ville , timeid) VALUES ( 'xavki2', 'xavier', 'Caen', now());
```

