#!/bin/bash

apt --fix-broken install -y openjdk-8-jre-headless python
wget https://downloads.apache.org/cassandra/3.11.6/debian/cassandra_3.11.6_all.deb
dpkg -i cassandra_3.11.6_all.deb
systemctl start cassandra
systemctl enable cassandra
