%title: CASSANDRA
%author: xavki


# CASSANDRA : Token Ring


<br>


* Query modeling

|		ID	| 	NOM			|		ADRESSE		|		ID_COMMANDE		|		ETC		|
|		1		|		Xavier	|		1 rue			|				1					|					|
|		1		|		Xavier	|		1 rue			|				2					|					|
|		2		|		Pierre	|		2 rue			|				3					|					|


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


* Principes :
	* clef de partition > fonction de hashage (inf 64 bits) > token > distribution dans le token ring
