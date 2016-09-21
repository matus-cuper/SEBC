## On each host mount new device, add record to /etc/fstab and setup noatime
```
[root@ip-172-31-13-166 ec2-user]# mkdir -p /data/01
[root@ip-172-31-13-166 ec2-user]# fdisk /dev/xvdf
[root@ip-172-31-13-166 ec2-user]# mkfs -t ext4 /dev/xvdf1         # n, p, 1, <Enter>, <Enter>, w  
[root@ip-172-31-13-166 ec2-user]# mount /dev/xvdf1 /data/01
```
### Edit /etc/fstab
```
UUID=72b4b87c-c1b3-4481-851d-<disk-uuid> /data/01      ext4    defaults,noatime 0 2
```
## On each host setup swappiness, reserved space, start services
```
[root@ip-172-31-13-166 ec2-user]# cat /proc/sys/vm/swappiness 
60
[root@ip-172-31-13-166 ec2-user]# echo 1 > /proc/sys/vm/swappinessa
[root@ip-172-31-13-166 ec2-user]# echo "vm.swappiness = 1" > /etc/sysctl.conf
[root@ip-172-31-13-166 ec2-user]# cat /proc/sys/vm/swappiness 
1
[root@ip-172-31-13-166 ec2-user]# mkfs.ext4 /dev/xvdf1 -m 0
[root@ip-172-31-13-166 ec2-user]# chkconfig nscd on
[root@ip-172-31-13-166 ec2-user]# chkconfig ntpd on
[root@ip-172-31-13-166 ec2-user]# service nscd start
[root@ip-172-31-13-166 ec2-user]# service ntpd start
```
## Setup hostanames
```
[root@ip-172-31-13-166 ec2-user]# hostname cuper1.cdh.seb
[root@ip-172-31-13-166 ec2-user]# vim /etc/sysconfig/network
HOSTNAME=cuper1.cdh.seb                                 # edit hostname
[root@ip-172-31-13-166 ec2-user]# echo "cuper1.cdh.seb" > /proc/sys/kernel/hostname 
```
## Add to /etc/hosts
```
172.31.13.166 cuper1.cdh.seb cuper1
172.31.13.167 cuper2.cdh.seb cuper2
172.31.13.164 cuper3.cdh.seb cuper3
172.31.13.163 cuper4.cdh.seb cuper4
172.31.13.165 cuper5.cdh.seb cuper5
```
## Install MySQL 5.5
```
[root@cuper1 ec2-user]# wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm
[root@cuper1 ec2-user]# rpm -Uvh mysql57-community-release-el6-9.noarch.rpm
[root@cuper1 ec2-user]# vim /etc/yum.repos.d/mysql-community.repo             
# set enabled for version 5.5 and disable all other versions
```
### On replica nodes
```
[root@cuper1 ec2-user]# yum install mysql-community-server
```
### On other nodes
```
[root@cuper3 ec2-user]# yum install mysql-community-server
```
### On all nodes
```
[root@cuper1 ec2-user]# mkdir /usr/share/java
[root@cuper1 ec2-user]# wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz
[root@cuper1 ec2-user]# tar -xvzf mysql-connector-java-5.1.39.tar.gz 
[root@cuper1 ec2-user]# cp mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar /usr/share/java/mysql-connector-java.jar
```
### On replica nodes
```
[root@cuper1 ec2-user]# /usr/bin/mysql_secure_installation          # f3M64Fb1SefG16e8 , y, n, y, y
```
### On host1 vim /etc/my.cnf 
```
log-bin=mysql-bin
server-id=1
```
### On host1
```
[root@cuper1 ec2-user]# service mysqld start
[root@cuper1 ec2-user]# mysql -u root -pf3M64Fb1SefG16e8
mysql> GRANT REPLICATION SLAVE ON *.* TO 'cuper2'@'%.cdh.seb' IDENTIFIED BY '4FD5tb28Z1f1eN5e';
mysql> SET GLOBAL binlog_format = 'ROW';
mysql> FLUSH TABLES WITH READ LOCK;
mysql> SHOW MASTER STATUS;
mysql> UNLOCK TABLES;
```
### On host2 vim /etc/my.cnf 
```
server-id=2
```
### On host2
```
[root@cuper1 ec2-user]# service mysqld start
[root@cuper1 ec2-user]# mysql -u root -pf3M64Fb1SefG16e8
mysql> CHANGE MASTER TO
    ->     MASTER_HOST='cuper1.cdh.seb',
    ->     MASTER_USER='cuper2',
    ->     MASTER_PASSWORD='4FD5tb28Z1f1eN5e',
    ->     MASTER_LOG_FILE='mysql-bin.000003',
    ->     MASTER_LOG_POS=269;
mysql> START SLAVE;
mysql> SHOW SLAVE STATUS \G
```
## Setup passwordless SSH on each host
```
[root@cuper1 ec2-user]# ssh-keygen -t rsa                   # on one host
[root@cuper1 ec2-user]# vim /root/.ssh/id_rsa               # paste id_rsa
[root@cuper1 ec2-user]# chmod 400 /root/.ssh/id_rsa
[root@cuper1 ec2-user]# echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuYYVTYsiv58HvuKJizgXfhw8qPrHcj3kzRxT8iYPOLgn5LBd+tPd3OV43GY0V1ZcOJ7QLByAT/9yT7fValvorWXo1Ws9nI5xnevEu4S6mtplJ6wbJr788umwQbD3WAzu48ShiFoXHwLs+NrsrkKgvX+I2CYx/3Vi+oTK7DiQJWB+aY7rZQRUvwdOg84awELuGTmyMbCjkv09hZIGYXu9kWiJHo/g/nzIAE/Ru72PpjGHBXfwTppOSbo6ErT0KSgzwwDHX82Hovoai2XPEyoB5kmpYXPM1bwQ9xzsdwzbJqkwpHwPxP667tMBp6Bwrc3R+HOLpzmbnsXssGrUXF72PQ== root@cuper1.cdh.seb" >> /root/.ssh/authorized_keys
```
## Add repository on host1
```
[root@cuper1 ec2-user]# vim /etc/yum.repos.d/cloudera-manager.repo                  # paste content of https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
```
## On host1
```
[root@cuper1 ec2-user]# yum install oracle-j2sdk1.7
[root@cuper1 ec2-user]# yum install cloudera-manager-daemons cloudera-manager-server
[root@cuper1 ec2-user]# /usr/share/cmf/schema/scm_prepare_database.sh mysql -u root -p cloudera cloudera 5LBdfgtPd343gY0c
[root@cuper1 ec2-user]# service cloudera-scm-server start
```
## On all nodes
```
[root@cuper1 ec2-user]# echo never > /sys/kernel/mm/transparent_hugepage/defrag
```
## On host1
```
[root@cuper1 ec2-user]# mysql -u root -pf3M64Fb1SefG16e8
mysql> create database hive;
mysql> create database hue;
mysql> create database reports_manager;
mysql> create database oozie;
mysql> grant all on hive.* TO 'hive'@'%' IDENTIFIED BY 'hive';
mysql> grant all on hue.* TO 'hue'@'%' IDENTIFIED BY 'hue';
mysql> grant all on reports_manager.* TO 'reports_manager'@'%' IDENTIFIED BY 'reports_manager';
mysql> grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie';
```
## On all nodes setup user limits
```
[root@cuper1 ec2-user]# echo hdfs - nofile 32768 >> /etc/security/limits.conf
[root@cuper1 ec2-user]# echo mapred - nofile 32768 >> /etc/security/limits.conf
[root@cuper1 ec2-user]# echo hbase - nofile 32768 >> /etc/security/limits.conf
[root@cuper1 ec2-user]# echo hdfs - nproc 32768 >> /etc/security/limits.conf
[root@cuper1 ec2-user]# echo mapred - nproc 32768 >> /etc/security/limits.conf
[root@cuper1 ec2-user]# echo hbase - nproc 32768 >> /etc/security/limits.conf
# use for limit checks
runuser -l mapred -c 'ulimit -Hn'
```

