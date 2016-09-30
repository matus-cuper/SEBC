```
# Cloudera bootcamp NY 2016
# http://www.slideshare.net/technmsg/improving-hadoop-cluster-performance-via-linux-configuration

# matus_cuper_aws_eu-west1
54.158.195.196
54.167.148.28
54.173.90.74
52.91.120.153
54.152.60.98

# each host
mkdir -p /data/01
fdisk /dev/xvdf
mkfs -t ext4 /dev/xvdf1
mount /dev/xvdf1 /data/01
# edit fstab
UUID=b1ef16a8-f364-436f-a9b7-1ee5e452b81f /data/01      ext4    defaults,noatime 0 2

# setup swappiness
echo 1 > /proc/sys/vm/swappiness                                                # Immediate
echo "vm.swappiness = 1" >> /etc/sysctl.conf                                    # Persist after reboot
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo "echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag" >> /etc/rc.local

# setup reserved space
tune2fs -m 0 /dev/xvdf1                                                         # Set reserved space for non-root volumes to 0
# setup services
yum install -y nscd
chkconfig nscd on
chkconfig ntpd on
service nscd start
service ntpd start

# setup hostname
hostname cuper1.cdh.seb
# vim /etc/sysconfig/network
HOSTNAME=cuper1.cdh.seb
echo "cuper1.cdh.seb" > /proc/sys/kernel/hostname

# setup hosts
172.31.13.166 cuper1.cdh.seb cuper1
172.31.13.167 cuper2.cdh.seb cuper2
172.31.13.164 cuper3.cdh.seb cuper3
172.31.13.163 cuper4.cdh.seb cuper4
172.31.13.165 cuper5.cdh.seb cuper5


# install mysql 5.5
cd /tmp
wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm
rpm -Uvh mysql57-community-release-el6-9.noarch.rpm
vim /etc/yum.repos.d/mysql-community.repo
# set enabled to 1 for our version and deselect other selected
# on replica nodes
yum install mysql-community-server
# on other nodes
yum install mysql-community-client
# setup JDBC connector
mkdir /usr/share/java
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz
tar -xvzf mysql-connector-java-5.1.39.tar.gz
cp mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar /usr/share/java/mysql-connector-java.jar

/usr/bin/mysql_secure_installation
${PASSWORD}
y
n
y
y

# host1 vim /etc/my.cnf
log-bin=mysql-bin
server-id=1

service mysqld start
mysql -u root -p${PASSWORD}
GRANT REPLICATION SLAVE ON *.* TO 'cuper2'@'%.cdh.seb' IDENTIFIED BY '${PASSWORD}';

SET GLOBAL binlog_format = 'ROW';
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
UNLOCK TABLES;

# host2 vim /etc/my.cnf
server-id=2

service mysqld start
mysql
CHANGE MASTER TO
         MASTER_HOST='cuper1.cdh.seb',
         MASTER_USER='cuper2',
         MASTER_PASSWORD='4FD5tb28Z1f1eN5e',
         MASTER_LOG_FILE='mysql-bin.000003',
         MASTER_LOG_POS=269;

START SLAVE;
SHOW SLAVE STATUS \G

ssh-keygen -t rsa
vim /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
echo "${key}" >> /root/.ssh/authorized_keys

https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
vim /etc/yum.repos.d/cloudera-manager-repo

yum install oracle-j2sdk1.7
yum install cloudera-manager-daemons cloudera-manager-server

/usr/share/cmf/schema/scm_prepare_database.sh mysql -u root -p cloudera cloudera 5LBdfgtPd343gY0c

service cloudera-scm-server start


create database hive;
create database hue;
create database reports_manager;
create database oozie;
create database sentry;

ERROR 1130 (HY000): Host 'cuper2.cha.seb' is not allowed to connect to this MySQL server
grant all on hue.* TO 'hue'@'%' IDENTIFIED BY 'hue';
grant all on reports_manager.* TO 'reports_manager'@'%' IDENTIFIED BY 'reports_manager';
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie';
grant all on sentry.* TO 'sentry'@'%' IDENTIFIED BY 'sentry';

echo hdfs - nofile 32768 >> /etc/security/limits.conf
echo mapred - nofile 32768 >> /etc/security/limits.conf
echo hbase - nofile 32768 >> /etc/security/limits.conf
echo hdfs - nproc 32768 >> /etc/security/limits.conf
echo mapred - nproc 32768 >> /etc/security/limits.conf
echo hbase - nproc 32768 >> /etc/security/limits.conf

# use for limit checks
runuser -l mapred -c 'ulimit -Hn'

# structure
NODES
master            worker          edge          utlity
namenode          datanode        flume
resourcemanager   nodemanager     sqoop
                  regionserver    hue
                  implad          oozie
                  spark           impalad
                                  !datanode
                                  hiveserver2

# High availibility
3 nodes for storing fsimages, edits QJM (quorum journal manager), where active namenode store metadata
is good idea to have master node with 4 disks - 2 for mirrored OS, 1 for /opt and for /zookeeper

Key HDFS Features in C5
   Directory caching
   Directory snapshots
   NFS Gateway
   Backups

## DAY 2
hdfs dfs -mkdir /tmp/cuper_source
su - hdfs
yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 5000000 /tmp/cuper-teragenout-500MB
hdfs dfs -mkdir /tmp/target
hadoop distcp hdfs://klempa2.cdh.seb/tmp/klempa-teragenout-500MB hdfs://cuper1.cdh.seb/tmp/target

time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 -Ddfs.block.size=32000000 100000000 /tmp/cuper-teragenout-10GB
# real	5m10.553s user	0m6.943s sys	0m0.443s
hdfs cacheadmin -addPool testPool
hdfs cacheadmin -addDirective -path /tmp/cuper-teragenout-10GB -pool testPool
# see caching
hdfs cacheadmin -listPools -stats testPool

time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar terasort -Dmapreduce.job.reduces=24 /tmp/cuper-teragenout-10GB /tmp/cuper-terasortout-10GB-1
# real	6m27.827s user	0m9.145s sys	0m0.458s
time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar terasort -Dmapreduce.job.reduces=24 /tmp/cuper-teragenout-10GB /tmp/cuper-terasortout-10GB-2
# real	6m40.694s user	0m9.134s sys	0m0.468s
http://blog.cloudera.com/blog/2014/08/new-in-cdh-5-1-hdfs-read-caching/

mkdir /data/01/dfs/jn
chown hdfs:hdfs /data/01/dfs/jn

# The following manual steps must be performed after completing this wizard:
# http://www.cloudera.com/documentation/archive/manager/4-x/4-8-5/Cloudera-Manager-Managing-Clusters/cmmc_HDFS_hi_avail.html?scroll=cmug_topic_5_12_3_unique_1__title_182_unique_1
# Configure the HDFS Web Interface Role of Hue service(s) Hue to be an HTTPFS role instead of a NameNode. Documentation
# For each of the Hive service(s) Hive, stop the Hive service, back up the Hive Metastore Database to a persistent store, run the service command "Update Hive Metastore NameNodes", then restart the Hive service


hdfs cacheadmin -listDirectives
hdfs cacheadmin -listPools -stats testPool
hdfs cacheadmin -addPool testPool
hdfs cacheadmin -addDirective -path /tmp/cuper-teragenout-10GB -pool testPool
hdfs cacheadmin -removeDirective 1
hdfs cacheadmin -modifyPool testPool -maxTtl 1s
hdfs cacheadmin -modifyDirective -id 3 -ttl 1s


time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teravalidate -Dmapreduce.job.reduces=10 /tmp/cuper-terasortout-10GB-1 /tmp/klempa-teravalidateout-10GB
real	0m44.251s
user	0m5.688s
sys	0m0.353s
time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teravalidate -Dmapreduce.job.reduces=10 /tmp/cuper-terasortout-10GB-1 /tmp/klempa-teravalidateout-10GB-1
real	0m43.407s
user	0m5.926s
sys	0m0.325s

# DAY 3
# create own repo for parcels
mkdir -p /var/www/html/cdh5/parcels/latest /var/www/html/gplextras5/parcels/latest /var/www/html/accumulo/parcels/latest /var/www/html/sqoop-connectors/parcels/latest /var/www/html/impala/parcels/latest /var/www/html/search/parcels/latest /var/www/html/spark/parcels/latest
cd /var/www/html/cdh5/parcels/latest && wget https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.3.10-1.cdh5.3.10.p0.19-el6.parcel && wget https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.3.10-1.cdh5.3.10.p0.19-el6.parcel.sha1 && wget https://archive.cloudera.com/cdh5/parcels/latest/manifest.json
cd /var/www/html/gplextras5/parcels/latest && wget https://archive.cloudera.com/gplextras5/parcels/latest/GPLEXTRAS-5.3.5-1.cdh5.3.5.p0.4-el6.parcel && wget https://archive.cloudera.com/gplextras5/parcels/latest/GPLEXTRAS-5.3.5-1.cdh5.3.5.p0.4-el6.parcel.sha1 && wget https://archive.cloudera.com/gplextras5/parcels/latest/manifest.json
cd /var/www/html/accumulo/parcels/latest && wget http://archive.cloudera.com/accumulo/parcels/latest/ACCUMULO-1.6.0-1.cdh4.6.0.p0.273-el6.parcel && wget http://archive.cloudera.com/accumulo/parcels/latest/ACCUMULO-1.6.0-1.cdh4.6.0.p0.273-el6.parcel.sha1 && wget http://archive.cloudera.com/accumulo/parcels/latest/manifest.json
cd /var/www/html/sqoop-connectors/parcels/latest && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_NETEZZA_CONNECTOR-1.3c5-el6.parcel && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_NETEZZA_CONNECTOR-1.3c5-el6.parcel.sha1 && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_TERADATA_CONNECTOR-1.5c5-el6.parcel && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_TERADATA_CONNECTOR-1.5c5-el6.parcel.sha1 && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/manifest.json
cd /var/www/html/impala/parcels/latest && wget http://archive.cloudera.com/impala/parcels/latest/IMPALA-2.1.0-1.impala2.0.0.p0.1995-el6.parcel && wget http://archive.cloudera.com/impala/parcels/latest/manifest.json
cd /var/www/html/search/parcels/latest && wget http://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel && wget http://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel.sha1 && wget http://archive.cloudera.com/search/parcels/latest/manifest.json
cd /var/www/html/spark/parcels/latest && wget http://archive.cloudera.com/spark/parcels/latest/SPARK-0.9.0-1.cdh4.6.0.p0.98-el6.parcel && wget http://archive.cloudera.com/spark/parcels/latest/SPARK-0.9.0-1.cdh4.6.0.p0.98-el6.parcel.sha1 && wget http://archive.cloudera.com/spark/parcels/latest/manifest.json

http://cuper-repo.cdh.seb/cdh5/parcels/latest/
http://cuper-repo.cdh.seb/impala/parcels/latest/
http://cuper-repo.cdh.seb/search/parcels/latest/
http://cuper-repo.cdh.seb/accumulo/parcels/latest/
http://cuper-repo.cdh.seb/spark/parcels/latest/
http://cuper-repo.cdh.seb/sqoop-connectors/parcels/latest/

# security
4 pillars
  - authentication    Kerberos, LDAP
  - authorization     Sentry, RecordService
  - encryption        in-transit, at-rest
  - auditing          Navigator

kinit
kinit -k (keytab) -t (keytab file)
klist
kdestroy
kvno
kadmin
kadmin.local
realm - users in the same group
/var/kerberos/krb5kdc/...*
/var/run/cloudera-scm-agent/proccess/<dir>/...keytab

sentry is like firewall

# on server
yum install krb5-server krb5-libs krb5-auth-dialog
# on all hosts
yum install krb5-workstation krb5-libs krb5-auth-dialog

# Change realms and add to end
vim /etc/krb5.conf
[realms]
 CUPER.CDH.SEB = {
  kdc = cuper1.cdh.seb
  admin_server = cuper1.cdh.seb
 }

[domain_realm]
 .example.com = CUPER.CDH.SEB
 example.com = CUPER.CDH.SEB


# change realms and add to end
vim /var/kerberos/krb5kdc/kdc.conf
default_principal_flags = +renewable
max_life = 1d
max_renewable_life = 7d

kdb5_util create -s                 # cloudera
service krb5kdc start

kadmin.local
  addprinc -pw cloudera mcuper/admin@CUPER.CDH.SEB
  addprinc -pw cloudera cloudera-scm/admin@CUPER.CDH.SEB

vim /var/kerberos/krb5kdc/kadm5.acl
*/admin@CUPER.CDH.SEB   *
cloudera-scm/admin@CUPER.CDH.SEB        *

service kadmin start

# distribute /etc/krb5.conf over hosts and test
kinit mcuper/admin
kadmin -p mcuper/admin

addprinc hdfs@CUPER.CDH.SEB
addprinc hive@CUPER.CDH.SEB
addprinc hue@CUPER.CDH.SEB
addprinc oozie@CUPER.CDH.SEB
addprinc yarn@CUPER.CDH.SEB
addprinc zookeeper@CUPER.CDH.SEB

# fastest
Mappers: 10 Reducers: 10 Container memory: 512
real	4m0.626s
user	0m8.595s
sys	0m0.425s
# slowest
Mappers: 10 Reducers: 2 Container memory: 1024
real	6m12.380s
user	0m9.273s
sys	0m0.517s

!connect jdbc:hive2://localhost:10000/default;principal=hive/cuper1.cdh.seb@CUPER.CDH.SEB


groupadd selector
groupadd inserters
useradd -u 1100 -g selector george
useradd -u 1200 -g inserters ferdinand
kadmin.local: add_principal george
kadmin.local: add_principal ferdinand




##############################################################################
####################          Challenge         ##############################
##############################################################################

gdisk /dev/xvdl
p
o y
n  hexcode
x
g
uid
w y

54.173.70.151
54.197.88.20
54.175.180.19
54.162.226.253
54.175.153.102

echo hostname: cuper1 >> /etc/cloud/cloud.cfg.d/01_hostname.cfg
echo fqdn: cuper1.cha.seb >> /etc/cloud/cloud.cfg.d/01_hostname.cfg

echo hostname: cuper2 >> /etc/cloud/cloud.cfg.d/01_hostname.cfg
echo fqdn: cuper2.cha.seb >> /etc/cloud/cloud.cfg.d/01_hostname.cfg

echo hostname: cuper3 >> /etc/cloud/cloud.cfg.d/01_hostname.cfg
echo fqdn: cuper3.cha.seb >> /etc/cloud/cloud.cfg.d/01_hostname.cfg

echo hostname: cuper4 >> /etc/cloud/cloud.cfg.d/01_hostname.cfg
echo fqdn: cuper4.cha.seb >> /etc/cloud/cloud.cfg.d/01_hostname.cfg

echo hostname: cuper5 >> /etc/cloud/cloud.cfg.d/01_hostname.cfg
echo fqdn: cuper5.cha.seb >> /etc/cloud/cloud.cfg.d/01_hostname.cfg

vim /etc/hosts
# Challenge cluster
172.31.5.134 cuper1.cha.seb cuper1
172.31.5.135 cuper2.cha.seb cuper2
172.31.5.136 cuper3.cha.seb cuper3
172.31.5.137 cuper4.cha.seb cuper4
172.31.5.138 cuper5.cha.seb cuper5

ssh-keygen -t rsa
vim /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxH9z+T5MiIXivgjyAKC3YEFb8ofTH8Fy3OhKfrWnL3szpkq04vwTD+90zSyanLWh6qnlIUSAp16J7u6WYU/XQXnrbbSMpyrh39E3wYwKshkHtMF+BwJEh2uCV3ffOohA7eJ2EXfGuNzolYfCvQylDFj9QpTU4EjNygwBOfV2NPQZm90wIpXQ/ubDXBvtdiFyykF6T5rGxacDRbI3zpmPGL2VQ4CjABfWjtrQ5tn9KsTDdSu1WCmA+vxiCHFPHg9gSeYsryanjCNW43JfDW+JNSGkjX25+U4Y/2TbgiHA86FzjyOFzn9s+zWD2mb4AcjzdlS+WXrBoUFeeVrcdHaexw== root@ip-172-31-5-134.cdh.deb" >> /root/.ssh/authorized_keys

echo 1 > /proc/sys/vm/swappiness
echo "vm.swappiness = 1" >> /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo "echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag" >> /etc/rc.local

cat /etc/cloud/cloud.cfg.d/01_hostname.cfg
cat /proc/sys/vm/swappiness
cat /sys/kernel/mm/transparent_hugepage/defrag

# on all hosts
useradd -u 2500 christie
useradd -u 2501 weiner
groupadd pictures
groupadd bridges
usermod -g pictures weiner
usermod -g bridges christie

# on all hosts
wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm
rpm -Uvh mysql57-community-release-el6-9.noarch.rpm
vim /etc/yum.repos.d/mysql-community.repo         # select right version
# on MySQL host
yum install mysql-community-server
# on other hosts
yum install mysql-community-client

mkdir /usr/share/java && wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz && tar -xvzf mysql-connector-java-5.1.39.tar.gz && cp mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar /usr/share/java/mysql-connector-java.jar
hostname cuper1.cha.seb && echo "cuper1.cha.seb" > /proc/sys/kernel/hostname
hostname cuper2.cha.seb && echo "cuper2.cha.seb" > /proc/sys/kernel/hostname
hostname cuper3.cha.seb && echo "cuper3.cha.seb" > /proc/sys/kernel/hostname
hostname cuper4.cha.seb && echo "cuper4.cha.seb" > /proc/sys/kernel/hostname
hostname cuper5.cha.seb && echo "cuper5.cha.seb" > /proc/sys/kernel/hostname

service mysqld start
mysql

create database scm;
create database rman;
create database hive;
create database oozie;
create database hue;
create database sentry;

wget https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
vim cloudera-manager.repo         # https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5.8.0/
mv cloudera-manager.repo /etc/yum.repos.d/
yum clean all

yum install oracle-j2sdk1.7
yum install cloudera-manager-daemons cloudera-manager-server

# on MySQL node
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

# on CM node
mysql -h cuper1.cha.seb
grant all on scm.* TO 'scm'@'cuper2.cha.seb' IDENTIFIED BY 'scm';
grant all on *.* to 'temp'@'%' identified by 'temp' with grant option;
/usr/share/cmf/schema/scm_prepare_database.sh mysql -h cuper1.cha.seb -utemp -ptemp --scm-host cuper2.cha.seb scm scm scm

service cloudera-scm-server start

yum install -y nscd && chkconfig nscd on && chkconfig ntpd on && service nscd start && service ntpd start

grant all on hive.* TO 'hive'@'%' IDENTIFIED BY 'hive';
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'rman';
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie';

hdfs dfs -mkdir /user/christie
hdfs dfs -mkdir /user/weiner
hdfs dfs -chown christie:christie /user/christie
hdfs dfs -chown weiner:weiner /user/weiner

yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 -Ddfs.block.size=64000000 500 /user/christie/tgen64-1
```
