%title: CASSANDRA
%author: xavki


# CASSANDRA : Introduction


<br>
* moteur de bases de données NoSql

<br>
* NOSQL vs SQL = ACID vs CAP Theorem (Théorème de Brewer)
		* Consistence
		* Availability
		* Partition tolérance

<br>
* origines : facebook

* opensourcé en 2008

* fondation apache

* utilisé :
		* apple : 70k nodes (100 Pb)
		* netflix : 2,5k

* concurents :
		* big tables
		* Amazon DynamoDB

<br>
* système distribué :
		* fault tolerant
		* hautement scalable
		* gros volumes

--------------------------------------------------------------------------

# CASSANDRA : Introduction


<br>
Atouts :

* réponse au besoin de scalabilité applicatif > BDD

* plus cluster est grand > plus il est robuste (paradoxe)

* opensource

* résistance à la panne

* hautement performant

* système distribué (pas de SPOF)

* microservices = simplification des modélisations de BDD

* langage CQL proche de SQL

--------------------------------------------------------------------------

# CASSANDRA : Introduction


<br>
Défauts :

* pas ACID sur le principe > système distribué et répliqué

* éventuellement consistente

* non adapté à la consistence même si elle en fait (pb de perf)

* pas de modélsation complexes : clés étrangères, index...


