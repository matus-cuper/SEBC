### aws region
```
us-east
N. Virginia
```
### AMI
```
ami-23abb849
RHEL-6.7_HVM-20160412-x86_64-1-Hourly2-GP2 (ami-23abb849)
```
## public IP MySQL host
```
54.173.70.151
```
### ls /usr/java
```
[root@cuper1 ec2-user]# ls /usr/java
ls: cannot access /usr/java: No such file or directory
```
## Add users and groups
```
useradd -u 2500 christie
useradd -u 2501 weiner
groupadd pictures
groupadd bridges
usermod -g pictures weiner
usermod -g bridges christie
```
## cat /etc/passwd
```
christie:x:2500:2503::/home/christie:/bin/bash
weiner:x:2501:2502::/home/weiner:/bin/bash
```
## cat /etc/group
```
pictures:x:2502:
bridges:x:2503:
```

