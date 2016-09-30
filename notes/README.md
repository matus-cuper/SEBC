# Cloudera bootcamp NY 2016
``` http://www.slideshare.net/technmsg/improving-hadoop-cluster-performance-via-linux-configuration ```

## Initial setup
* On each host setup disks
```
tune2fs -m 0 /dev/xvdf1         # Set reserved space for non-root devices
mkdir -p /data/01
fdisk /dev/xvdf
mkfs -t ext4 /dev/xvdf1
mount /dev/xvdf1 /data/01
```
* And edit fstab **vim /etc/fstab**
```
UUID=b1ef16a8-f364-436f-a9b7-1ee5e452b81f /data/01      ext4    defaults,noatime 0 2
```

* On each host setup swappiness and hugepages
```
echo 1 > /proc/sys/vm/swappiness                                                          # Immediate
echo "vm.swappiness = 1" >> /etc/sysctl.conf                                              # Persist after reboot
echo never > /sys/kernel/mm/transparent_hugepage/defrag                                   # Immediate
echo "echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag" >> /etc/rc.local    # Persist after reboot
```

* On each host install nscd, enable and start nscd and ntpd
```
yum install -y nscd
chkconfig nscd on
chkconfig ntpd on
service nscd start
service ntpd start
```

* On each host setup hostname
```
hostname cuper1.cdh.seb
echo "cuper1.cdh.seb" > /proc/sys/kernel/hostname
```
* And edit network **vim /etc/sysconfig/network**
```
HOSTNAME=cuper1.cdh.seb
```

* On each host setup hosts **vim /etc/hosts**
```
172.31.13.166 cuper1.cdh.seb cuper1
172.31.13.167 cuper2.cdh.seb cuper2
172.31.13.164 cuper3.cdh.seb cuper3
172.31.13.163 cuper4.cdh.seb cuper4
172.31.13.165 cuper5.cdh.seb cuper5
```

* On one node generate public key
```
ssh-keygen -t rsa
```
* Copy over other hosts private key **vim /root/.ssh/id_rsa**
* Copy over other hosts public key
```
chmod 400 /root/.ssh/id_rsa
echo "ssh-rsa $PUBLIC_KEY" >> /root/.ssh/authorized_keys
```

## Install MySQL 5.5

* On each host download and edit repo
```
cd /tmp && wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm
rpm -Uvh mysql57-community-release-el6-9.noarch.rpm
```
* Select right version and deselect others **vim /etc/yum.repos.d/mysql-community.repo**
```
enabled=0
 # or
enabled=1
```
* On replica nodes install server
```
yum install -y mysql-community-server
```
* On other nodes install client
```
yum install mysql-community-client
```

* On each host setup JDBC connector
```
mkdir /usr/share/java
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz
tar -xvzf mysql-connector-java-5.1.39.tar.gz
cp mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar /usr/share/java/mysql-connector-java.jar
```

* On master replica run secure installation **/usr/bin/mysql\_secure\_installation**

* On master replica edit configuration **vim /etc/my.cnf**
```
log-bin=mysql-bin
server-id=1
```
* And configure master eplica
```
service mysqld start
mysql -u root
GRANT REPLICATION SLAVE ON *.* TO 'cuper2'@'%.cdh.seb' IDENTIFIED BY '$PASSWORD';
SET GLOBAL binlog_format = 'ROW';
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
UNLOCK TABLES;
quit;
```

* On slave replica edit configuration **vim /etc/my.cnf**
```
server-id=2
```
* And configure slave replica
```
service mysqld start
mysql
CHANGE MASTER TO
         MASTER_HOST='cuper1.cdh.seb',
         MASTER_USER='cuper2',
         MASTER_PASSWORD='$PASSWORD',
         MASTER_LOG_FILE='mysql-bin.000003',                       # from SHOW MASTER STATUS;
         MASTER_LOG_POS=269;
START SLAVE;
SHOW SLAVE STATUS \G
```

## Install Cloudera Mnagaer

* On CM host download and move repositry
```
wget https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
mv cloudera-manager.repo /etc/yum.repos.d/cloudera-manager.repo
```

* On CM host install CM and JDK
```
yum install -y oracle-j2sdk1.7
yum install -y cloudera-manager-daemons cloudera-manager-server
```

* On master replica prepare database
```
/usr/share/cmf/schema/scm_prepare_database.sh mysql -u root -p $CLOUDERA_USER $CLOUDERA_PASSWORD $PASSWORD
```

* On CM host start CM server
```
service cloudera-scm-server start
```

* On master replica create databases for CM
```
create database hive;
create database hue;
create database rman;
create database oozie;
create database sentry;
grant all on hive.* TO 'hive'@'%' IDENTIFIED BY 'hive';
grant all on hue.* TO 'hue'@'%' IDENTIFIED BY 'hue';
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'rman';
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie';
grant all on sentry.* TO 'sentry'@'%' IDENTIFIED BY 'sentry';
```

* Install cluster in Web UI
 * **TIP** It is good idea to have master node with 4 disk - 2 for mirrored OS, 1 for /opt and 1 for /zookeeper
* On each host setup user limits
```
echo hdfs - nofile 32768 >> /etc/security/limits.conf
echo mapred - nofile 32768 >> /etc/security/limits.conf
echo hbase - nofile 32768 >> /etc/security/limits.conf
echo hdfs - nproc 32768 >> /etc/security/limits.conf
echo mapred - nproc 32768 >> /etc/security/limits.conf
echo hbase - nproc 32768 >> /etc/security/limits.conf
```

## HDFS Testing

* Create file for colleague with teragen and copy one from him
```
su - hdfs
yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 5000000 /tmp/cuper-teragenout-500MB
hdfs dfs -mkdir /tmp/target
hadoop distcp hdfs://klempa2.cdh.seb/tmp/klempa-teragenout-500MB hdfs://cuper1.cdh.seb/tmp/target
```

* Run teragen with specific HDFS block size
```
yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 -Ddfs.block.size=32000000 100000000 /tmp/cuper-teragenout-10GB
```

* Setup cached pool for teragen output
```
hdfs cacheadmin -addPool testPool
hdfs cacheadmin -addDirective -path /tmp/cuper-teragenout-10GB -pool testPool
hdfs cacheadmin -listPools -stats testPool                                        # see caching
```

* Run terasort
```
yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar terasort -Dmapreduce.job.reduces=24 /tmp/cuper-teragenout-10GB /tmp/cuper-terasortout-10GB
```

## Create own repository for parcels

* On repository node
```
mkdir -p /var/www/html/cdh5/parcels/latest /var/www/html/gplextras5/parcels/latest /var/www/html/accumulo/parcels/latest /var/www/html/sqoop-connectors/parcels/latest /var/www/html/impala/parcels/latest /var/www/html/search/parcels/latest /var/www/html/spark/parcels/latest
cd /var/www/html/cdh5/parcels/latest && wget https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.3.10-1.cdh5.3.10.p0.19-el6.parcel && wget https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.3.10-1.cdh5.3.10.p0.19-el6.parcel.sha1 && wget https://archive.cloudera.com/cdh5/parcels/latest/manifest.json
cd /var/www/html/gplextras5/parcels/latest && wget https://archive.cloudera.com/gplextras5/parcels/latest/GPLEXTRAS-5.3.5-1.cdh5.3.5.p0.4-el6.parcel && wget https://archive.cloudera.com/gplextras5/parcels/latest/GPLEXTRAS-5.3.5-1.cdh5.3.5.p0.4-el6.parcel.sha1 && wget https://archive.cloudera.com/gplextras5/parcels/latest/manifest.json
cd /var/www/html/accumulo/parcels/latest && wget http://archive.cloudera.com/accumulo/parcels/latest/ACCUMULO-1.6.0-1.cdh4.6.0.p0.273-el6.parcel && wget http://archive.cloudera.com/accumulo/parcels/latest/ACCUMULO-1.6.0-1.cdh4.6.0.p0.273-el6.parcel.sha1 && wget http://archive.cloudera.com/accumulo/parcels/latest/manifest.json
cd /var/www/html/sqoop-connectors/parcels/latest && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_NETEZZA_CONNECTOR-1.3c5-el6.parcel && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_NETEZZA_CONNECTOR-1.3c5-el6.parcel.sha1 && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_TERADATA_CONNECTOR-1.5c5-el6.parcel && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP_TERADATA_CONNECTOR-1.5c5-el6.parcel.sha1 && wget http://archive.cloudera.com/sqoop-connectors/parcels/latest/manifest.json
cd /var/www/html/impala/parcels/latest && wget http://archive.cloudera.com/impala/parcels/latest/IMPALA-2.1.0-1.impala2.0.0.p0.1995-el6.parcel && wget http://archive.cloudera.com/impala/parcels/latest/manifest.json
cd /var/www/html/search/parcels/latest && wget http://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel && wget http://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel.sha1 && wget http://archive.cloudera.com/search/parcels/latest/manifest.json
cd /var/www/html/spark/parcels/latest && wget http://archive.cloudera.com/spark/parcels/latest/SPARK-0.9.0-1.cdh4.6.0.p0.98-el6.parcel && wget http://archive.cloudera.com/spark/parcels/latest/SPARK-0.9.0-1.cdh4.6.0.p0.98-el6.parcel.sha1 && wget http://archive.cloudera.com/spark/parcels/latest/manifest.json
```

* Change URLs in Cloudera Manager Web UI
```
http://cuper-repo.cdh.seb/cdh5/parcels/latest/
http://cuper-repo.cdh.seb/impala/parcels/latest/
http://cuper-repo.cdh.seb/search/parcels/latest/
http://cuper-repo.cdh.seb/accumulo/parcels/latest/
http://cuper-repo.cdh.seb/spark/parcels/latest/
http://cuper-repo.cdh.seb/sqoop-connectors/parcels/latest/
```

## Security

* On Kerberos server
```
yum install krb5-server krb5-libs krb5-auth-dialog
```

* And edit and add to end of KDC configuration **vim /var/kerberos/krb5kdc/kdc.conf**
```
default_principal_flags = +renewable
max_life = 1d
max_renewable_life = 7d
```

* On each host
```
yum install krb5-workstation krb5-libs krb5-auth-dialog
```
* And change realms and add to end of  Kerberos configuration **vim /etc/krb5.conf**
```
[realms]
 CUPER.CDH.SEB = {
  kdc = cuper1.cdh.seb
  admin_server = cuper1.cdh.seb
 }
[domain_realm]
 .example.com = CUPER.CDH.SEB
 example.com = CUPER.CDH.SEB
```

* On Kerberos server create Kerberos database and start service
```
kdb5_util create -s
service krb5kdc start
```

* Create principals for admin users on Kerberos server
```
kadmin.local
addprinc -pw cloudera mcuper/admin@CUPER.CDH.SEB
addprinc -pw cloudera cloudera-scm/admin@CUPER.CDH.SEB
```
* And edit kadmin ACL configuration file **vim /var/kerberos/krb5kdc/kadm5.acl**
```
*/admin@CUPER.CDH.SEB   *
cloudera-scm/admin@CUPER.CDH.SEB        *
```
* And start kadmin service
```
service kadmin start
```

* On each host test kadmin
```
kinit mcuper/admin
kadmin -p mcuper/admin
```
* And create principals for services
```
addprinc hdfs@CUPER.CDH.SEB
addprinc hive@CUPER.CDH.SEB
addprinc hue@CUPER.CDH.SEB
addprinc oozie@CUPER.CDH.SEB
addprinc yarn@CUPER.CDH.SEB
addprinc zookeeper@CUPER.CDH.SEB
```

* Test connection to hive
```
beeline
!connect jdbc:hive2://localhost:10000/default;principal=hive/cuper1.cdh.seb@CUPER.CDH.SEB
```
