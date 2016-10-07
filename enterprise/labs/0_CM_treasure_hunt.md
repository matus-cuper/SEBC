## What is ubertask optimization?
```
runs "sufficiently small" jobs sequentially within a single JVM
```

## Where in CM is the Kerberos Security Realm value displayed?
```
Security Security -> Kerberos Credentials
```

## Which CDH service(s) host a property for enabling Kerberos authentication?
```
hue, hive, zookeeper, oozie, yarn, hdfs, sentry
```

mfernest - More generally, all active services must have a property to enable Kerberos. Configuring each service for Kerberos is the most time-consuming and error-prone aspect that automation makes easier. It is also the reason backing out of wizard-driven Kerberos configuration has to be done by hand -- the service dependency tree makes automating a rollback extremely difficult.

## How do you upgrade the CM agents?
```
via upgrade wizard that is invoked when you connect to the Admin Console or manually install the Cloudera Manager Agent packages
```

## Give the tsquery statement used to chart Hue's CPU utilization?
```

```

mfernest - Have you figured this one out?


## Name all the roles that make up the Hive service
```
Hive Gateway, Hive Metastore Server, HiveServer2, WebHCat Server
```

## What steps must be compelted before integrating Cloudera Manager with Kerberos?
```
installed kerberos and created pricipal for Cloudera Manager
```

mfernest- Review all the checkboxes you're required to fill before starting CM's Kerberos wizard.
