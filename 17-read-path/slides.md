%title: Cassandra
%author: xavki


# CASSANDRA : Le Read Path

<br>

* que se passe-t-il au niveau du worker ?

		client > coordinateur > worker > coordinateur > client

------------------------------------------------------------------------

# CASSANDRA : Le Read Path

<br>

* différents outils entrent en compte :

		* memtables

		* bloom filter

		* row cache

		* key cache


------------------------------------------------------------------------

# CASSANDRA : Le Read Path

<br>

Première étape : la réponse rapide

		* la clef se trouve-elle en memtables (mémoire) ?

<br>

		* ou peut être se trouve-t-elle dans un premier cache
			le row cache ? (information complète key + datas)
				* optionnel
				* hors heap (mémoire jvm)	

------------------------------------------------------------------------

# CASSANDRA : Le Read Path

<br>

Deuxième étape : un peu moins mais toujours très efficace

		* la clef est elle référencée dans le bloom filter ?

		* ou est-elle référence dans le key cache ?
				* juste la clef de partition
				* sans les datas (par défaut en heap)
				* reste optionnel

		* si oui cassandra va directement au compression offset
				* permet l'accès direct aux sstables (données sur disque)	


------------------------------------------------------------------------

# CASSANDRA : Le Read Path

<br>

Troisième étape : longue

		* pas de key cache

		* trouver les partitions summary

		* indexation des partitions

		* accès au sstables sur disque
