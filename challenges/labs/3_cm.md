## SHOW GRANTS FOR HIVE;
```
mysql> SHOW GRANTS FOR hive;
+-----------------------------------------------------------------------------------------------------+
| Grants for hive@%                                                                                   |
+-----------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'hive'@'%' IDENTIFIED BY PASSWORD '*4DF1D66463C18D44E3B001A8FB1BBFBEA13E27FC' |
| GRANT ALL PRIVILEGES ON `hive`.* TO 'hive'@'%'                                                      |
+-----------------------------------------------------------------------------------------------------+
2 rows in set (0.00 sec)
```
## SHOW GRANTS FOR RMAN;
```
mysql> SHOW GRANTS FOR rman;
+-----------------------------------------------------------------------------------------------------+
| Grants for rman@%                                                                                   |
+-----------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'rman'@'%' IDENTIFIED BY PASSWORD '*819397F8B454D58DA4E9F42A88A4873756B8C96D' |
| GRANT ALL PRIVILEGES ON `rman`.* TO 'rman'@'%'                                                      |
+-----------------------------------------------------------------------------------------------------+
2 rows in set (0.00 sec)
```
## SHOW GRANTS FOR OOZIE;
```
mysql> SHOW GRANTS FOR oozie;
+------------------------------------------------------------------------------------------------------+
| Grants for oozie@%                                                                                   |
+------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'oozie'@'%' IDENTIFIED BY PASSWORD '*2B03FE0359FAD3B80620490CE614F8622E0828CD' |
| GRANT ALL PRIVILEGES ON `oozie`.* TO 'oozie'@'%'                                                     |
+------------------------------------------------------------------------------------------------------+
2 rows in set (0.00 sec)
```
## hadoop users
```
[hdfs@cuper1 ~]$ hdfs dfs -ls /user
Found 6 items
drwxr-xr-x   - christie christie          0 2016-09-23 11:48 /user/christie
drwxrwxrwx   - mapred   hadoop            0 2016-09-23 11:47 /user/history
drwxrwxr-t   - hive     hive              0 2016-09-23 11:48 /user/hive
drwxrwxr-x   - hue      hue               0 2016-09-23 11:48 /user/hue
drwxrwxr-x   - oozie    oozie             0 2016-09-23 11:48 /user/oozie
drwxr-xr-x   - weiner   weiner            0 2016-09-23 11:48 /user/weiner
```
## hadoop classpath
```
[hdfs@cuper1 ~]$ hadoop classpath
/etc/hadoop/conf:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop/lib/*:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop/.//*:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop-hdfs/./:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop-hdfs/lib/*:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop-hdfs/.//*:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop-yarn/lib/*:/opt/cloudera/parcels/CDH-5.7.3-1.cdh5.7.3.p0.5/lib/hadoop/libexec/../../hadoop-yarn/.//*:/opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/lib/*:/opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/.//*
```
## API call
```
{
  "items" : [ {
    "hostId" : "i-94521c6c",
    "ipAddress" : "172.31.5.134",
    "hostname" : "cuper1.cha.seb",
    "rackId" : "/default",
    "hostUrl" : "http://cuper2.cha.seb:7180/cmf/hostRedirect/i-94521c6c",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 2,
    "totalPhysMemBytes" : 15664750592
  }, {
    "hostId" : "i-9b521c63",
    "ipAddress" : "172.31.5.135",
    "hostname" : "cuper2.cha.seb",
    "rackId" : "/default",
    "hostUrl" : "http://cuper2.cha.seb:7180/cmf/hostRedirect/i-9b521c63",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 2,
    "totalPhysMemBytes" : 15664750592
  }, {
    "hostId" : "i-9a521c62",
    "ipAddress" : "172.31.5.136",
    "hostname" : "cuper3.cha.seb",
    "rackId" : "/default",
    "hostUrl" : "http://cuper2.cha.seb:7180/cmf/hostRedirect/i-9a521c62",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 2,
    "totalPhysMemBytes" : 15664750592
  }, {
    "hostId" : "i-99521c61",
    "ipAddress" : "172.31.5.137",
    "hostname" : "cuper4.cha.seb",
    "rackId" : "/default",
    "hostUrl" : "http://cuper2.cha.seb:7180/cmf/hostRedirect/i-99521c61",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 2,
    "totalPhysMemBytes" : 15664750592
  }, {
    "hostId" : "i-98521c60",
    "ipAddress" : "172.31.5.138",
    "hostname" : "cuper5.cha.seb",
    "rackId" : "/default",
    "hostUrl" : "http://cuper2.cha.seb:7180/cmf/hostRedirect/i-98521c60",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 2,
    "totalPhysMemBytes" : 15664750592
  } ]
}
```

