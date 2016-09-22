## start hive
```
curl -XPOST -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive/commands/start
{
  "id" : 951,
  "name" : "Start",
  "startTime" : "2016-09-22T15:24:36.426Z",
  "active" : true,
  "serviceRef" : {
    "clusterName" : "cluster",
    "serviceName" : "hive"
  }
}
```

## stop hive
```
curl -XPOST -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive/commands/stop
{
  "id" : 945,
  "name" : "Stop",
  "startTime" : "2016-09-22T15:23:32.640Z",
  "active" : true,
  "serviceRef" : {
    "clusterName" : "cluster",
    "serviceName" : "hive"
  }
}
```

## get hive state
```
curl -X GET -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive
{
  "name" : "hive",
  "type" : "HIVE",
  "clusterRef" : {
    "clusterName" : "cluster"
  },
  "serviceUrl" : "http://cuper1.cdh.seb:7180/cmf/serviceRedirect/hive",
  "roleInstancesUrl" : "http://cuper1.cdh.seb:7180/cmf/serviceRedirect/hive/instances",
  "serviceState" : "STARTED",
  "healthSummary" : "GOOD",
  "healthChecks" : [ {
    "name" : "HIVE_HIVEMETASTORES_HEALTHY",
    "summary" : "GOOD",
    "suppressed" : false
  }, {
    "name" : "HIVE_HIVESERVER2S_HEALTHY",
    "summary" : "GOOD",
    "suppressed" : false
  } ],
  "configStalenessStatus" : "FRESH",
  "clientConfigStalenessStatus" : "STALE",
  "maintenanceMode" : false,
  "maintenanceOwners" : [ ],
  "displayName" : "Hive",
  "entityStatus" : "GOOD_HEALTH"
}
```
