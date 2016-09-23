## teragen command
```
time yarn jar /opt/cloudera/parcels/CDH/jars/hadoop-mapreduce-examples-2.6.0-cdh5.7.3.jar teragen -Dmapreduce.job.maps=48 -Ddfs.block.size=64000000 51200000 /user/christie/tgen64-1

```
## time output
```
real	4m2.131s
user	0m6.243s
sys	0m0.328s
```
## hdfs dfs -ls output
```
[christie@cuper1 root]$ hdfs dfs -ls /user/christie/tgen64
Found 49 items
-rw-r--r--   3 christie christie          0 2016-09-23 12:05 /user/christie/tgen64/_SUCCESS
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00000
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00001
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00002
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00003
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00004
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00005
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00006
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00007
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00008
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00009
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00010
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00011
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00012
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00013
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00014
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00015
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00016
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:02 /user/christie/tgen64/part-m-00017
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00018
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:03 /user/christie/tgen64/part-m-00019
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:03 /user/christie/tgen64/part-m-00020
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:02 /user/christie/tgen64/part-m-00021
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:04 /user/christie/tgen64/part-m-00022
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00023
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00024
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:04 /user/christie/tgen64/part-m-00025
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00026
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00027
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00028
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00029
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:03 /user/christie/tgen64/part-m-00030
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00031
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:03 /user/christie/tgen64/part-m-00032
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:03 /user/christie/tgen64/part-m-00033
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:03 /user/christie/tgen64/part-m-00034
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:03 /user/christie/tgen64/part-m-00035
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00036
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00037
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00038
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00039
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00040
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00041
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00042
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00043
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00044
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00045
-rw-r--r--   3 christie christie  106666700 2016-09-23 12:05 /user/christie/tgen64/part-m-00046
-rw-r--r--   3 christie christie  106666600 2016-09-23 12:05 /user/christie/tgen64/part-m-00047
```
## blocks created
```
Total blocks (validated):	144 (avg. block size 35555902 B)
```

