%title: Cassandra
%author: xavki


# CASSANDRA : Backup à partir d'un snapshot

<br>

sudo mkdir -p /srv/cassandra/
sudo chmod 777 -R /srv/
sudo apt-get install -y nfs-kernel-server 2>&1 > /dev/null
sudo echo "/srv/cassandra 192.168.12.0/24(rw,sync,no_root_squash,no_subtree_check)">/etc/exports
sudo systemctl restart nfs-server rpcbind
sudo exportfs -a

sudo apt install -y nfs-common
sudo mkdir -p /data/backups
echo "192.168.12.103:/srv/cassandra /data/backups  nfs defaults 0  0" | sudo tee -a /etc/fstab
sudo mount -a

mkdir /data/backups/$(hostname)


benthos -c cassandra_sample.yml

nodetool snapshot -t xavki_now xavki
nodetool listsnapshots

```
cp -r /var/lib/cassandra/data/xavki/t1-*/snapshots/xavki_now/* /data/backups/cassandra1/
```

nodetool clearsnapshot -t xavki_now

```
cqlsh $(hostname -I | awk '{print $2}') -e "drop table xavki.t1;"
cqlsh $(hostname -I | awk '{print $2}') -e "select count(*) from xavki.t1;"
```

rm -rf /var/lib/cassandra/data/xavki/*
systemctl stop cassandra
ps aux | grep java

cqlsh $(hostname -I | awk '{print $2}') < /data/backups/cassandra1/schema.cql


cp /data/backups/cassandra1/* /var/lib/cassandra/data/xavki/t1-*/


nodetool repair --full
cqlsh $(hostname -I | awk '{print $2}') -e "select count(*) from xavki.t1;"
