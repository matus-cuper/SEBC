```
Spent 432ms computing base-splits.
Spent 3ms computing TeraScheduler splits.
Computing input splits took 436ms
Sampling 10 splits of 80
Making 2 from 100000 sampled records
Computing parititions took 4134ms
Spent 4573ms computing partitions.

16/09/22 11:39:00 INFO terasort.TeraSort: starting
16/09/22 11:39:03 INFO hdfs.DFSClient: Created HDFS_DELEGATION_TOKEN token 110 for hdfs on ha-hdfs:nameservice1
16/09/22 11:39:03 INFO security.TokenCache: Got dt for hdfs://nameservice1; Kind: HDFS_DELEGATION_TOKEN, Service: ha-hdfs:nameservice1, Ident: (HDFS_DELEGATION_TOKEN token 110 for hdfs)
16/09/22 11:39:03 INFO input.FileInputFormat: Total input paths to process : 10
16/09/22 11:39:07 INFO client.RMProxy: Connecting to ResourceManager at cuper1.cdh.seb/172.31.13.166:8032
16/09/22 11:39:08 INFO mapreduce.JobSubmitter: number of splits:80
16/09/22 11:39:08 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1474506762579_0099
16/09/22 11:39:08 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: ha-hdfs:nameservice1, Ident: (HDFS_DELEGATION_TOKEN token 110 for hdfs)
16/09/22 11:39:08 INFO impl.YarnClientImpl: Submitted application application_1474506762579_0099
16/09/22 11:39:09 INFO mapreduce.Job: The url to track the job: http://cuper1.cdh.seb:8088/proxy/application_1474506762579_0099/
16/09/22 11:39:09 INFO mapreduce.Job: Running job: job_1474506762579_0099
16/09/22 11:39:17 INFO mapreduce.Job: Job job_1474506762579_0099 running in uber mode : false
16/09/22 11:39:17 INFO mapreduce.Job:  map 0% reduce 0%
16/09/22 11:39:55 INFO mapreduce.Job:  map 1% reduce 0%
16/09/22 11:39:56 INFO mapreduce.Job:  map 2% reduce 0%
16/09/22 11:39:57 INFO mapreduce.Job:  map 4% reduce 0%
16/09/22 11:39:58 INFO mapreduce.Job:  map 6% reduce 0%
16/09/22 11:39:59 INFO mapreduce.Job:  map 11% reduce 0%
16/09/22 11:40:00 INFO mapreduce.Job:  map 14% reduce 0%
16/09/22 11:40:01 INFO mapreduce.Job:  map 17% reduce 0%
16/09/22 11:40:02 INFO mapreduce.Job:  map 23% reduce 0%
16/09/22 11:40:03 INFO mapreduce.Job:  map 27% reduce 0%
16/09/22 11:40:04 INFO mapreduce.Job:  map 28% reduce 0%
16/09/22 11:40:05 INFO mapreduce.Job:  map 32% reduce 0%
16/09/22 11:40:06 INFO mapreduce.Job:  map 33% reduce 0%
16/09/22 11:40:08 INFO mapreduce.Job:  map 34% reduce 0%
16/09/22 11:40:11 INFO mapreduce.Job:  map 35% reduce 0%
16/09/22 11:40:13 INFO mapreduce.Job:  map 37% reduce 0%
16/09/22 11:40:14 INFO mapreduce.Job:  map 39% reduce 0%
16/09/22 11:40:15 INFO mapreduce.Job:  map 41% reduce 0%
16/09/22 11:40:16 INFO mapreduce.Job:  map 43% reduce 0%
16/09/22 11:40:17 INFO mapreduce.Job:  map 45% reduce 0%
16/09/22 11:40:18 INFO mapreduce.Job:  map 49% reduce 0%
16/09/22 11:40:19 INFO mapreduce.Job:  map 53% reduce 0%
16/09/22 11:40:23 INFO mapreduce.Job:  map 54% reduce 0%
16/09/22 11:40:27 INFO mapreduce.Job:  map 55% reduce 0%
16/09/22 11:40:33 INFO mapreduce.Job:  map 56% reduce 0%
16/09/22 11:40:35 INFO mapreduce.Job:  map 58% reduce 0%
16/09/22 11:40:36 INFO mapreduce.Job:  map 61% reduce 0%
16/09/22 11:40:37 INFO mapreduce.Job:  map 63% reduce 0%
16/09/22 11:40:38 INFO mapreduce.Job:  map 64% reduce 0%
16/09/22 11:40:39 INFO mapreduce.Job:  map 67% reduce 0%
16/09/22 11:40:40 INFO mapreduce.Job:  map 68% reduce 0%
16/09/22 11:40:41 INFO mapreduce.Job:  map 73% reduce 0%
16/09/22 11:40:42 INFO mapreduce.Job:  map 77% reduce 0%
16/09/22 11:40:43 INFO mapreduce.Job:  map 80% reduce 0%
16/09/22 11:40:44 INFO mapreduce.Job:  map 83% reduce 0%
16/09/22 11:40:45 INFO mapreduce.Job:  map 84% reduce 0%
16/09/22 11:40:46 INFO mapreduce.Job:  map 85% reduce 0%
16/09/22 11:40:47 INFO mapreduce.Job:  map 87% reduce 0%
16/09/22 11:40:48 INFO mapreduce.Job:  map 89% reduce 0%
16/09/22 11:40:51 INFO mapreduce.Job:  map 90% reduce 0%
16/09/22 11:40:54 INFO mapreduce.Job:  map 93% reduce 0%
16/09/22 11:40:55 INFO mapreduce.Job:  map 95% reduce 0%
16/09/22 11:40:56 INFO mapreduce.Job:  map 96% reduce 0%
16/09/22 11:40:57 INFO mapreduce.Job:  map 98% reduce 0%
16/09/22 11:40:59 INFO mapreduce.Job:  map 100% reduce 0%
16/09/22 11:41:07 INFO mapreduce.Job:  map 100% reduce 6%
16/09/22 11:41:10 INFO mapreduce.Job:  map 100% reduce 9%
16/09/22 11:41:13 INFO mapreduce.Job:  map 100% reduce 11%
16/09/22 11:41:16 INFO mapreduce.Job:  map 100% reduce 14%
16/09/22 11:41:19 INFO mapreduce.Job:  map 100% reduce 16%
16/09/22 11:41:22 INFO mapreduce.Job:  map 100% reduce 19%
16/09/22 11:41:25 INFO mapreduce.Job:  map 100% reduce 21%
16/09/22 11:41:28 INFO mapreduce.Job:  map 100% reduce 25%
16/09/22 11:41:31 INFO mapreduce.Job:  map 100% reduce 27%
16/09/22 11:41:34 INFO mapreduce.Job:  map 100% reduce 29%
16/09/22 11:41:37 INFO mapreduce.Job:  map 100% reduce 30%
16/09/22 11:41:40 INFO mapreduce.Job:  map 100% reduce 48%
16/09/22 11:41:43 INFO mapreduce.Job:  map 100% reduce 64%
16/09/22 11:41:46 INFO mapreduce.Job:  map 100% reduce 69%
16/09/22 11:41:49 INFO mapreduce.Job:  map 100% reduce 70%
16/09/22 11:41:52 INFO mapreduce.Job:  map 100% reduce 72%
16/09/22 11:41:55 INFO mapreduce.Job:  map 100% reduce 74%
16/09/22 11:41:58 INFO mapreduce.Job:  map 100% reduce 75%
16/09/22 11:42:01 INFO mapreduce.Job:  map 100% reduce 76%
16/09/22 11:42:07 INFO mapreduce.Job:  map 100% reduce 77%
16/09/22 11:42:10 INFO mapreduce.Job:  map 100% reduce 78%
16/09/22 11:42:16 INFO mapreduce.Job:  map 100% reduce 79%
16/09/22 11:42:22 INFO mapreduce.Job:  map 100% reduce 80%
16/09/22 11:42:28 INFO mapreduce.Job:  map 100% reduce 81%
16/09/22 11:42:34 INFO mapreduce.Job:  map 100% reduce 82%
16/09/22 11:42:46 INFO mapreduce.Job:  map 100% reduce 84%
16/09/22 11:42:49 INFO mapreduce.Job:  map 100% reduce 85%
16/09/22 11:43:01 INFO mapreduce.Job:  map 100% reduce 87%
16/09/22 11:43:04 INFO mapreduce.Job:  map 100% reduce 88%
16/09/22 11:43:10 INFO mapreduce.Job:  map 100% reduce 89%
16/09/22 11:43:13 INFO mapreduce.Job:  map 100% reduce 90%
16/09/22 11:43:16 INFO mapreduce.Job:  map 100% reduce 91%
16/09/22 11:43:22 INFO mapreduce.Job:  map 100% reduce 92%
16/09/22 11:43:31 INFO mapreduce.Job:  map 100% reduce 93%
16/09/22 11:43:40 INFO mapreduce.Job:  map 100% reduce 94%
16/09/22 11:44:07 INFO mapreduce.Job:  map 100% reduce 96%
16/09/22 11:44:28 INFO mapreduce.Job:  map 100% reduce 97%
16/09/22 11:44:31 INFO mapreduce.Job:  map 100% reduce 98%
16/09/22 11:44:50 INFO mapreduce.Job:  map 100% reduce 99%
16/09/22 11:44:56 INFO mapreduce.Job:  map 100% reduce 100%
16/09/22 11:45:12 INFO mapreduce.Job: Job job_1474506762579_0099 completed successfully
16/09/22 11:45:12 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=4500315518
		FILE: Number of bytes written=8913013859
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=10000009680
		HDFS: Number of bytes written=10000000000
		HDFS: Number of read operations=246
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=4
	Job Counters 
		Launched map tasks=80
		Launched reduce tasks=2
		Data-local map tasks=79
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=4240954
		Total time spent by all reduces in occupied slots (ms)=407773
		Total time spent by all map tasks (ms)=4240954
		Total time spent by all reduce tasks (ms)=407773
		Total vcore-seconds taken by all map tasks=4240954
		Total vcore-seconds taken by all reduce tasks=407773
		Total megabyte-seconds taken by all map tasks=4342736896
		Total megabyte-seconds taken by all reduce tasks=417559552
	Map-Reduce Framework
		Map input records=100000000
		Map output records=100000000
		Map output bytes=10200000000
		Map output materialized bytes=4402515319
		Input split bytes=9680
		Combine input records=0
		Combine output records=0
		Reduce input groups=100000000
		Reduce shuffle bytes=4402515319
		Reduce input records=100000000
		Reduce output records=100000000
		Spilled Records=200000000
		Shuffled Maps =160
		Failed Shuffles=0
		Merged Map outputs=160
		GC time elapsed (ms)=24586
		CPU time spent (ms)=973550
		Physical memory (bytes) snapshot=42063237120
		Virtual memory (bytes) snapshot=128249065472
		Total committed heap usage (bytes)=53241970688
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=10000000000
	File Output Format Counters 
		Bytes Written=10000000000
16/09/22 11:45:12 INFO terasort.TeraSort: done
```
