## On namenode host create teragen file and try terasort with created cache pool
```
[hdfs@cuper1 ec2-user]# time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=48 -Ddfs.block.size=32000000 100000000 /tmp/cuper-teragenout-10GB
real	5m10.553s 
user	0m6.943s 
sys	    0m0.443s
[hdfs@cuper1 ec2-user]# time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar terasort -Dmapreduce.job.reduces=24 /tmp/cuper-teragenout-10GB /tmp/cuper-terasortout-10GB-2
real	6m40.694s
user	0m9.134s
sys	    0m0.468s
[hdfs@cuper1 ec2-user]# hdfs cacheadmin -addPool testPool
[hdfs@cuper1 ec2-user]# hdfs cacheadmin -addDirective -path /tmp/cuper-teragenout-10GB -pool testPool
[hdfs@cuper1 ec2-user]# hdfs cacheadmin -listPools -stats testPool
Found 1 result.
NAME      OWNER  GROUP  MODE            LIMIT  MAXTTL  BYTES_NEEDED  BYTES_CACHED  BYTES_OVERLIMIT  FILES_NEEDED  FILES_CACHED
testPool  hdfs   hdfs   rwxr-xr-x   unlimited   never   10000000000   10000000000                0            49            49
[hdfs@cuper1 ec2-user]# time yarn jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-mapreduce-examples-*.jar terasort -Dmapreduce.job.reduces=24 /tmp/cuper-teragenout-10GB /tmp/cuper-terasortout-10GB-1
real	6m27.827s 
user	0m9.145s 
sys 	    0m0.458s
```
There is no reason for change of execution time terasort command. Terasort reads teragen output only once, so cached directory is read once too. Because of that, difference between execution time of terasort with and without cached directory is so small.
