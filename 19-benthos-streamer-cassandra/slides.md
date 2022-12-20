%title: Cassandra
%author: xavki


# CASSANDRA : Benthos - écrire et lire

<br>

* install benthos

```
curl -Lsf https://sh.benthos.dev | bash 2>&1 >/dev/null
```

-------------------------------------------------------------------

# CASSANDRA : Benthos - écrire et lire

<br>

* cqlsh

```
apt install -y python3-pip
pip3 install cqlsh
```

-------------------------------------------------------------------

# CASSANDRA : Benthos - écrire et lire

<br>

* création keyspace & table

```
cqlsh cassandra1 -e "CREATE KEYSPACE IF NOT EXISTS xavki WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 2} ;"
cqlsh cassandra1 -e "CREATE TABLE IF NOT EXISTS xavki.T1 ( uid varchar PRIMARY KEY, text varchar );"
```

