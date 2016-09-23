## output of mysql --version
```
[root@cuper1 ec2-user]# mysql --version
mysql  Ver 14.14 Distrib 5.5.52, for Linux (x86_64) using readline 5.1
```
## output for a list of databases in MySQL
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| hive               |
| hue                |
| mysql              |
| oozie              |
| performance_schema |
| rman               |
| scm                |
| sentry             |
| test               |
+--------------------+
10 rows in set (0.00 sec)
```
## output for a list of grants in MySQL
```
mysql> show grants;
+---------------------------------------------------------------------+
| Grants for root@localhost                                           |
+---------------------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION |
| GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION        |
+---------------------------------------------------------------------+
2 rows in set (0.00 sec)
```

