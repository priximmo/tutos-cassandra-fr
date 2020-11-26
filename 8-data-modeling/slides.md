%title: CASSANDRA
%author: xavki


# CASSANDRA : DATA MODELING


<br>


* data modeling = modélisation de données

<br>


* différence importante entre sql et nosql
		* modélisation/conception différente

<br>


DUPLICATION/DENORMALIZATION ???

* normalisation >> dénormalisation
		* classement par objets >> requêtes/interrogations
		* logique métier (users/factures...) >> logique applicative
		* liens forts entre eux >> pas de lien (pas de jointure)
		* voir stocker des éléments calculés

* unicité >> duplication
		* tables de références / clefs étrangère/externes >> pas de lien
		* plusieurs tables peuvent disposer de la même info réparties différement

-------------------------------------------------------------------------------------------

# CASSANDRA : DATA MODELING


<br>


POURQUOI ?

* hardware >> coûts sont faibles (iops / volumes / performances / carte réseau... )

* simplification de la conception

* simplification de la maintenance

* moins de relations = plus de performances

* microservices >> le relationnel se fait au niveau des applicatifs

<br>


EVOLUTION DES ENJEUX

* sql => moins d'écritures / pas de duplication 

* cassandra => optimisation de la distribution / partitionnement large pour facilité la lecture

* anticipation des requêtes (filtre = where, tri = group/sort)

<br>


CONCRETEMENT

* sql :  tables users + factures + commandes >> requête factures par users / commandes par users

* cassandra : TABLE des factures par utilisateurs / TABLE des commandes par users


