%title: CASSANDRA
%author: xavki


# CASSANDRA : Quorum et Consistency


<br>


* utilisation du token ring pour assurer la consistence

		* Consistency Level = nombre de réplicas qui répondent > s'applique à la session/client
		* Réplication factor = nombre de réplicas

<br>


* quorum > principe de vote

<br>


* replication factor = nombre de noeuds avec des réplicas

* en lecture et en écriture

<br>


* quorum = (RF / 2) / 1
		ex : RF = 3 >> quorum = 2

<br>


* défini au niveau de chaque DC :
		RF = somme des réplications factors des DC

------------------------------------------------------------------------------------------

# CASSANDRA : Quorum et Consistency

<br>


* Consistency Level :
		* ONE : 1 replica suffit à confirmer
		* TWO : 2 ..
		* THREE : 3 ..
		* QUORUM : résultat au moins du quorum
		* LOCAL_QUORUM : quorum au niveau du DC (du coordinator)
		* LOCAL_ONE : 1 au niveau du DC (éviter les latences)
		* ALL : tous les noeuds doivent répondre mais si diff on retient plus récente (+ hint pour MAJ)

<br>


* exemple : https://stph.scenari-community.org/contribs/nos/Cassandra3/co/3_2_2-Consistency-Level.html

	* cluster 10 noeuds > N1...N10
<br>


	* RF = 4 et CL = QUORUM (3)

<br>


	* une valeur vaut D1, C1 la met à jour en D1 via N1 (coordinator)
<br>


	* avec les latences
<br>


			*  N1 > N2 = 1s plus tard
<br>


			*  N1 > N3 = 2s plus tard
<br>


			*  N1 > N4 = 3s plus tard
<br>


	* C2 demande la donnée à 1,5s > quorum non atteint pour la nlle valeur > retourne l'ancienne valeur 


------------------------------------------------------------------------------------------

# CASSANDRA : Quorum et Consistency

<br>


* connaitre la consistence de la session CQLSH

```
CONSISTENCY
```

* définir

```
CONSISTENCY ONE
CONSISTENCY QUORUM
```

* via le client (application) - exemple

```
QueryOptions qo = new QueryOptions().setConsistencyLevel(ConsistencyLevel.ALL);
```

<br>


* définir le replication factor

```
CREATE KEYSPACE myks
WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'dc1' : 3, 'dc2' : 2};
```

<br>


* pour modifier le RF

```
ALTER KEYSPACE myks
WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'dc1' : 2, 'dc2' : 2};
```

puis

```
nodetool repair --full myks
```
