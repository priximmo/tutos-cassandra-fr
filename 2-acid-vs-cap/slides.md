%title: CASSANDRA
%author: xavki


# CASSANDRA : ACID vs CAP Theorem


<br>


* ACID = RDBMS (Relational DataBase Management System)
<br>


		* Atomicité : 1 élément d'une transaction plante, fait planté toute la transaction
<br>


		* Consistence : état est consistent du début à la fin de la transaction
<br>


		* Isolation : indépendance des transactions (tant que c'est pas fini c'est pas pris en compte)
<br>


		* Durabilité : 1 transaction terminée est pris en compte de manière permanente

<br>


* CAP Theorem ou Théorème de Brewer : https://fr.wikipedia.org/wiki/Théorème_CAP
<br>


		* Consistence : même état sur tous les serveurs
<br>


		* Availability : réponse systématique aux requête
<br>


		* Partition : autonomie si coupure réseau... et la suite
<br>



Rq : équilibre à trouver entre les 3 facteurs (notamment Consistence/Availability)

-------------------------------------------------------------------------------------------------------------


# CASSANDRA : ACID vs CAP Theorem


<br>


* la réponse BASE : https://fr.wikipedia.org/wiki/Paxos_(informatique)
<br>


		* Basically Availabitlity : on répond à toutes les requêtes
<br>


		* Soft : éventuellement consistent tout le temps (dispo)
<br>


		* Eventually consistent : si plus de requête => on est consistent

Rq : approcher de la consistence avec un quorum

<br>


* Pas de transaction mais PAXOS Protocol
		* protocoles de consensus pour système distribué faillible
		* Rôles
<br>


				* Client : adresse des requêtes
<br>


				* Acceptor (Votants) : machine servant à établir le quorum
<br>


				* Proposer : interlocuteur du client
<br>


				* Learner : réalise la requête vérifiée auprès de Votants
<br>


				* Leader : Proposer unique pour éviter la concurence 


