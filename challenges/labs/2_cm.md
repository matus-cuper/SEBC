## content of /etc/yum.repos.d
```
[root@cuper2 ec2-user]# ls /etc/yum.repos.d
cloudera-manager.repo  mysql-community.repo  mysql-community-source.repo  redhat.repo  redhat-rhui-client-config.repo  redhat-rhui.repo  rhel-source.repo  rhui-load-balancers.conf
```
## grant statement
```
mysql> grant all on scm.* TO 'scm'@'cuper2.cha.seb' IDENTIFIED BY 'scm';
Query OK, 0 rows affected (0.01 sec)
```
## log output
```
[root@cuper2 ec2-user]# head -1 /var/log/cloudera-scm-server/cloudera-scm-server.log
2016-09-23 09:56:31,201 INFO main:com.cloudera.server.cmf.Main: Starting SCM Server. JVM Args: [-Dlog4j.configuration=file:/etc/cloudera-scm-server/log4j.properties, -Dfile.encoding=UTF-8, -Dcmf.root.logger=INFO,LOGFILE, -Dcmf.log.dir=/var/log/cloudera-scm-server, -Dcmf.log.file=cloudera-scm-server.log, -Dcmf.jetty.threshhold=WARN, -Dcmf.schema.dir=/usr/share/cmf/schema, -Djava.awt.headless=true, -Djava.net.preferIPv4Stack=true, -Dpython.home=/usr/share/cmf/python, -XX:+UseConcMarkSweepGC, -XX:+UseParNewGC, -XX:+HeapDumpOnOutOfMemoryError, -Xmx2G, -XX:MaxPermSize=256m, -XX:+HeapDumpOnOutOfMemoryError, -XX:HeapDumpPath=/tmp, -XX:OnOutOfMemoryError=kill -9 %p], Args: [], Version: 5.8.0 (#42 built by jenkins on 20160714-1246 git: d08ac14ff050a108864fab00205c12e0d4043132)
```
## grep output
```
[root@cuper2 ec2-user]# grep "Started Jetty server" /var/log/cloudera-scm-server/cloudera-scm-server.log
2016-09-23 10:06:16,547 INFO WebServerImpl:com.cloudera.server.cmf.WebServerImpl: Started Jetty server.
```

