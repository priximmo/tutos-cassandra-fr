%title: CASSANDRA
%author: xavki


# CASSANDRA : Paramétrage (kernel...)


<br>
* si NUMA (multisocket RHEL) > Non-uniform memory access > désactivation  zone_reclaim_mode

```
echo 0 > /proc/sys/vm/zone_reclaim_mode
```

NUMA : https://www.kernel.org/doc/html/v4.18/vm/numa.html

Problem : https://www.kernel.org/doc/gorman/html/understand/understand013.htmla

https://engineering.linkedin.com/performance/optimizing-linux-memory-management-low-latency-high-throughput-databases

---------------------------------------------------------------------------

# CASSANDRA : Paramétrage (kernel...)


<br>
* modificaton de sysctl.conf

<br>
SOCKET TCP

https://wwwx.cs.unc.edu/~sparkst/howto/network_tuning.php

<br>
* rmem : taille des tampons de réception utilisés par les sockets

```
net.core.rmem_max = 16777216
net.core.rmem_default = 16777216
```

<br>
* wmem : la quantité maximale de trafic qui peut être envoyée via une connexion TCP avant que l'expéditeur ait besoin de recevoir un accusé de réception du destinataire

```
net.core.wmem_max = 16777216
net.core.wmem_default = 16777216
```

https://docs.microsoft.com/fr-fr/azure/virtual-network/virtual-network-tcpip-performance-tuning

* tcp_rmem / tcp_wmem

```
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
```


* optmem_max

```
net.core.optmem_max = 40960
```

* prise en compte des paramètres

```
net.core.rmem_max = 16777216
net.core.rmem_default = 16777216
net.core.wmem_max = 16777216
net.core.wmem_default = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.core.optmem_max = 40960
vm.max_map_count = 1048575

sudo sysctl -p /etc/sysctl.conf
```


-------------------------------------------------------------------------


# CASSANDRA : Paramétrage (kernel...)


<br>
* optimisation SSD

https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/install/installRecommendSettings.html#OptimizeSSDs


<br>
*

```
vim /etc/security/limits.d/cassandra.conf
<cassandra_user> - memlock unlimited
<cassandra_user> - nofile 100000
<cassandra_user> - nproc 32768
<cassandra_user> - as unlimited
```

<br>

```
vim /etc/sysctl.conf
vm.max_map_count = 1048575
```


* debian 

```
vim /etc/pam.d/su
session    required   pam_limits.so
```

<br> 
* suppression du swap

```
sudo swapoff --all
vim /etc/fstab #comment swap
```

---------------------------------------------------------------------

# CASSANDRA : Paramétrage (kernel...)



<br>
* Changement de Garbage collector CMS > G1

<br>
* heap size (Xmx/Xms) : 1/4 à 1/2 de la ram


 https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/operations/opsTuneJVM.html
