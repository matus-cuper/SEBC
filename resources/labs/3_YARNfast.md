```
Spent 355ms computing base-splits.
Spent 4ms computing TeraScheduler splits.
Computing input splits took 359ms
Sampling 10 splits of 72
Making 10 from 100000 sampled records
Computing parititions took 1092ms
Spent 1454ms computing partitions.

16/09/22 11:28:08 INFO terasort.TeraSort: starting
16/09/22 11:28:10 INFO hdfs.DFSClient: Created HDFS_DELEGATION_TOKEN token 108 for hdfs on ha-hdfs:nameservice1
16/09/22 11:28:10 INFO security.TokenCache: Got dt for hdfs://nameservice1; Kind: HDFS_DELEGATION_TOKEN, Service: ha-hdfs:nameservice1, Ident: (HDFS_DELEGATION_TOKEN token 108 for hdfs)
16/09/22 11:28:10 INFO input.FileInputFormat: Total input paths to process : 9
16/09/22 11:28:11 INFO client.RMProxy: Connecting to ResourceManager at cuper1.cdh.seb/172.31.13.166:8032
16/09/22 11:28:12 INFO mapreduce.JobSubmitter: number of splits:72
16/09/22 11:28:12 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1474506762579_0097
16/09/22 11:28:12 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: ha-hdfs:nameservice1, Ident: (HDFS_DELEGATION_TOKEN token 108 for hdfs)
16/09/22 11:28:12 INFO impl.YarnClientImpl: Submitted application application_1474506762579_0097
16/09/22 11:28:12 INFO mapreduce.Job: The url to track the job: http://cuper1.cdh.seb:8088/proxy/application_1474506762579_0097/
16/09/22 11:28:12 INFO mapreduce.Job: Running job: job_1474506762579_0097
16/09/22 11:28:20 INFO mapreduce.Job: Job job_1474506762579_0097 running in uber mode : false
16/09/22 11:28:20 INFO mapreduce.Job:  map 0% reduce 0%
16/09/22 11:29:00 INFO mapreduce.Job:  map 1% reduce 0%
16/09/22 11:29:01 INFO mapreduce.Job:  map 2% reduce 0%
16/09/22 11:29:02 INFO mapreduce.Job:  map 3% reduce 0%
16/09/22 11:29:03 INFO mapreduce.Job:  map 5% reduce 0%
16/09/22 11:29:04 INFO mapreduce.Job:  map 9% reduce 0%
16/09/22 11:29:05 INFO mapreduce.Job:  map 14% reduce 0%
16/09/22 11:29:06 INFO mapreduce.Job:  map 19% reduce 0%
16/09/22 11:29:07 INFO mapreduce.Job:  map 24% reduce 0%
16/09/22 11:29:08 INFO mapreduce.Job:  map 29% reduce 0%
16/09/22 11:29:09 INFO mapreduce.Job:  map 32% reduce 0%
16/09/22 11:29:10 INFO mapreduce.Job:  map 36% reduce 0%
16/09/22 11:29:11 INFO mapreduce.Job:  map 37% reduce 0%
16/09/22 11:29:13 INFO mapreduce.Job:  map 38% reduce 0%
16/09/22 11:29:17 INFO mapreduce.Job:  map 39% reduce 0%
16/09/22 11:29:18 INFO mapreduce.Job:  map 40% reduce 0%
16/09/22 11:29:19 INFO mapreduce.Job:  map 44% reduce 0%
16/09/22 11:29:21 INFO mapreduce.Job:  map 46% reduce 0%
16/09/22 11:29:22 INFO mapreduce.Job:  map 50% reduce 0%
16/09/22 11:29:23 INFO mapreduce.Job:  map 54% reduce 0%
16/09/22 11:29:24 INFO mapreduce.Job:  map 56% reduce 0%
16/09/22 11:29:25 INFO mapreduce.Job:  map 58% reduce 0%
16/09/22 11:29:26 INFO mapreduce.Job:  map 60% reduce 0%
16/09/22 11:29:29 INFO mapreduce.Job:  map 61% reduce 0%
16/09/22 11:29:32 INFO mapreduce.Job:  map 62% reduce 0%
16/09/22 11:29:35 INFO mapreduce.Job:  map 65% reduce 0%
16/09/22 11:29:36 INFO mapreduce.Job:  map 67% reduce 0%
16/09/22 11:29:37 INFO mapreduce.Job:  map 68% reduce 0%
16/09/22 11:29:38 INFO mapreduce.Job:  map 70% reduce 0%
16/09/22 11:29:39 INFO mapreduce.Job:  map 75% reduce 0%
16/09/22 11:29:41 INFO mapreduce.Job:  map 77% reduce 0%
16/09/22 11:29:42 INFO mapreduce.Job:  map 81% reduce 0%
16/09/22 11:29:43 INFO mapreduce.Job:  map 83% reduce 0%
16/09/22 11:29:44 INFO mapreduce.Job:  map 84% reduce 0%
16/09/22 11:29:45 INFO mapreduce.Job:  map 86% reduce 0%
16/09/22 11:29:46 INFO mapreduce.Job:  map 87% reduce 0%
16/09/22 11:29:48 INFO mapreduce.Job:  map 90% reduce 0%
16/09/22 11:29:49 INFO mapreduce.Job:  map 92% reduce 0%
16/09/22 11:29:50 INFO mapreduce.Job:  map 93% reduce 0%
16/09/22 11:29:51 INFO mapreduce.Job:  map 94% reduce 0%
16/09/22 11:29:52 INFO mapreduce.Job:  map 95% reduce 0%
16/09/22 11:29:53 INFO mapreduce.Job:  map 96% reduce 0%
16/09/22 11:29:58 INFO mapreduce.Job:  map 96% reduce 4%
16/09/22 11:30:00 INFO mapreduce.Job:  map 97% reduce 15%
16/09/22 11:30:01 INFO mapreduce.Job:  map 97% reduce 19%
16/09/22 11:30:02 INFO mapreduce.Job:  map 98% reduce 19%
16/09/22 11:30:03 INFO mapreduce.Job:  map 99% reduce 24%
16/09/22 11:30:04 INFO mapreduce.Job:  map 100% reduce 27%
16/09/22 11:30:06 INFO mapreduce.Job:  map 100% reduce 36%
16/09/22 11:30:07 INFO mapreduce.Job:  map 100% reduce 45%
16/09/22 11:30:09 INFO mapreduce.Job:  map 100% reduce 50%
16/09/22 11:30:10 INFO mapreduce.Job:  map 100% reduce 60%
16/09/22 11:30:12 INFO mapreduce.Job:  map 100% reduce 67%
16/09/22 11:30:13 INFO mapreduce.Job:  map 100% reduce 71%
16/09/22 11:30:15 INFO mapreduce.Job:  map 100% reduce 72%
16/09/22 11:30:16 INFO mapreduce.Job:  map 100% reduce 75%
16/09/22 11:30:18 INFO mapreduce.Job:  map 100% reduce 76%
16/09/22 11:30:19 INFO mapreduce.Job:  map 100% reduce 78%
16/09/22 11:30:21 INFO mapreduce.Job:  map 100% reduce 79%
16/09/22 11:30:22 INFO mapreduce.Job:  map 100% reduce 81%
16/09/22 11:30:23 INFO mapreduce.Job:  map 100% reduce 82%
16/09/22 11:30:24 INFO mapreduce.Job:  map 100% reduce 83%
16/09/22 11:30:25 INFO mapreduce.Job:  map 100% reduce 85%
16/09/22 11:30:27 INFO mapreduce.Job:  map 100% reduce 86%
16/09/22 11:30:29 INFO mapreduce.Job:  map 100% reduce 87%
16/09/22 11:30:36 INFO mapreduce.Job:  map 100% reduce 88%
16/09/22 11:30:41 INFO mapreduce.Job:  map 100% reduce 89%
16/09/22 11:30:42 INFO mapreduce.Job:  map 100% reduce 90%
16/09/22 11:30:44 INFO mapreduce.Job:  map 100% reduce 91%
16/09/22 11:30:46 INFO mapreduce.Job:  map 100% reduce 92%
16/09/22 11:30:48 INFO mapreduce.Job:  map 100% reduce 93%
16/09/22 11:30:51 INFO mapreduce.Job:  map 100% reduce 94%
16/09/22 11:30:57 INFO mapreduce.Job:  map 100% reduce 95%
16/09/22 11:31:09 INFO mapreduce.Job:  map 100% reduce 96%
16/09/22 11:31:16 INFO mapreduce.Job:  map 100% reduce 97%
16/09/22 11:31:27 INFO mapreduce.Job:  map 100% reduce 98%
16/09/22 11:31:34 INFO mapreduce.Job:  map 100% reduce 99%
16/09/22 11:32:07 INFO mapreduce.Job:  map 100% reduce 100%
16/09/22 11:32:08 INFO mapreduce.Job: Job job_1474506762579_0097 completed successfully
16/09/22 11:32:08 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=4047252532
		FILE: Number of bytes written=8019349908
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=9000008640
		HDFS: Number of bytes written=9000000000
		HDFS: Number of read operations=246
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=20
	Job Counters 
		Launched map tasks=72
		Launched reduce tasks=10
		Data-local map tasks=72
		Total time spent by all maps in occupied slots (ms)=3768096
		Total time spent by all reduces in occupied slots (ms)=775375
		Total time spent by all map tasks (ms)=3768096
		Total time spent by all reduce tasks (ms)=775375
		Total vcore-seconds taken by all map tasks=3768096
		Total vcore-seconds taken by all reduce tasks=775375
		Total megabyte-seconds taken by all map tasks=3858530304
		Total megabyte-seconds taken by all reduce tasks=793984000
	Map-Reduce Framework
		Map input records=90000000
		Map output records=90000000
		Map output bytes=9180000000
		Map output materialized bytes=3961907664
		Input split bytes=8640
		Combine input records=0
		Combine output records=0
		Reduce input groups=90000000
		Reduce shuffle bytes=3961907664
		Reduce input records=90000000
		Reduce output records=90000000
		Spilled Records=180000000
		Shuffled Maps =720
		Failed Shuffles=0
		Merged Map outputs=720
		GC time elapsed (ms)=129809
		CPU time spent (ms)=1045120
		Physical memory (bytes) snapshot=34191441920
		Virtual memory (bytes) snapshot=91870871552
		Total committed heap usage (bytes)=27557625856
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=9000000000
	File Output Format Counters 
		Bytes Written=9000000000
16/09/22 11:32:08 INFO terasort.TeraSort: done
```
