```
{
  "timestamp" : "2016-09-22T14:56:18.411Z",
  "clusters" : [ {
    "name" : "matus-cuper",
    "version" : "CDH5",
    "services" : [ {
      "name" : "hive",
      "type" : "HIVE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "HIVEMETASTORE",
          "items" : [ {
            "name" : "hive_metastore_java_heapsize",
            "value" : "609222656"
          } ]
        }, {
          "roleType" : "HIVESERVER2",
          "items" : [ {
            "name" : "hiveserver2_enable_impersonation",
            "value" : "false"
          }, {
            "name" : "hiveserver2_java_heapsize",
            "value" : "609222656"
          }, {
            "name" : "hiveserver2_spark_driver_memory",
            "value" : "966367641"
          }, {
            "name" : "hiveserver2_spark_executor_cores",
            "value" : "4"
          }, {
            "name" : "hiveserver2_spark_executor_memory",
            "value" : "3545550028"
          }, {
            "name" : "hiveserver2_spark_yarn_driver_memory_overhead",
            "value" : "102"
          }, {
            "name" : "hiveserver2_spark_yarn_executor_memory_overhead",
            "value" : "596"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_metastore_database_host",
          "value" : "cuper1.cdh.seb"
        }, {
          "name" : "hive_metastore_database_name",
          "value" : "hive"
        }, {
          "name" : "hive_metastore_database_password",
          "value" : "hive"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "sentry_service",
          "value" : "sentry"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hive-GATEWAY-40f440eb8c840f585ac24687b9bdb48c",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-2583c0dd"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-988518d4e6639f6d4b60e44f5423c504",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-2283c0da"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-e25f8245db446772bd4fc5c3ad689748",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-2383c0db"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-HIVEMETASTORE-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "HIVEMETASTORE",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "20ji6w856fw7xs65e7faz97fa"
          } ]
        }
      }, {
        "name" : "hive-HIVESERVER2-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "HIVESERVER2",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "e78hfkjcl61cf02nc7uukdrq2"
          } ]
        }
      } ],
      "displayName" : "Hive"
    }, {
      "name" : "zookeeper",
      "type" : "ZOOKEEPER",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "SERVER",
          "items" : [ {
            "name" : "zookeeper_server_java_heapsize",
            "value" : "609222656"
          } ]
        } ],
        "items" : [ {
          "name" : "enableSecurity",
          "value" : "true"
        } ]
      },
      "roles" : [ {
        "name" : "zookeeper-SERVER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "bqy51funmrult988thvg34xff"
          }, {
            "name" : "serverId",
            "value" : "3"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-988518d4e6639f6d4b60e44f5423c504",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-2283c0da"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "ewy20nw9w3kxlp9r26mugumaq"
          }, {
            "name" : "serverId",
            "value" : "1"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "bv754dzbpgjnxbi3hju41o7ex"
          }, {
            "name" : "serverId",
            "value" : "2"
          } ]
        }
      } ],
      "displayName" : "ZooKeeper"
    }, {
      "name" : "hue",
      "type" : "HUE",
      "config" : {
        "roleTypeConfigs" : [ ],
        "items" : [ {
          "name" : "database_host",
          "value" : "cuper1.cdh.seb"
        }, {
          "name" : "database_password",
          "value" : "hue"
        }, {
          "name" : "database_type",
          "value" : "mysql"
        }, {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "hue_webhdfs",
          "value" : "hdfs-HTTPFS-533b55c3af4fef7c1ef8b9015f431d4f"
        }, {
          "name" : "oozie_service",
          "value" : "oozie"
        }, {
          "name" : "sentry_service",
          "value" : "sentry"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hue-HUE_SERVER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "HUE_SERVER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "ccdcdef3yx4umq40t46tn2sqo"
          }, {
            "name" : "secret_key",
            "value" : "jvq6MWwXQ1rGiuTRPELBWsuQ4t4ssv"
          } ]
        }
      }, {
        "name" : "hue-KT_RENEWER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "KT_RENEWER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "5kwajapctp3wlul73criayy3h"
          } ]
        }
      } ],
      "displayName" : "Hue"
    }, {
      "name" : "oozie",
      "type" : "OOZIE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "OOZIE_SERVER",
          "items" : [ {
            "name" : "oozie_database_host",
            "value" : "cuper1.cdh.seb"
          }, {
            "name" : "oozie_database_password",
            "value" : "oozie"
          }, {
            "name" : "oozie_database_type",
            "value" : "mysql"
          }, {
            "name" : "oozie_database_user",
            "value" : "oozie"
          }, {
            "name" : "oozie_java_heapsize",
            "value" : "609222656"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "oozie-OOZIE_SERVER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "OOZIE_SERVER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c8iolhd5ntac962bxpz75hb0c"
          } ]
        }
      } ],
      "displayName" : "Oozie"
    }, {
      "name" : "yarn",
      "type" : "YARN",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "mapred_reduce_tasks",
            "value" : "30"
          }, {
            "name" : "mapred_submit_replication",
            "value" : "2"
          } ]
        }, {
          "roleType" : "JOBHISTORY",
          "items" : [ {
            "name" : "mr2_jobhistory_java_heapsize",
            "value" : "609222656"
          } ]
        }, {
          "roleType" : "NODEMANAGER",
          "items" : [ {
            "name" : "container_executor_banned_users",
            "value" : "yarn,mapred,bin"
          }, {
            "name" : "container_executor_min_user_id",
            "value" : "0"
          }, {
            "name" : "yarn_nodemanager_heartbeat_interval_ms",
            "value" : "100"
          }, {
            "name" : "yarn_nodemanager_local_dirs",
            "value" : "/data/01/yarn/nm"
          }, {
            "name" : "yarn_nodemanager_log_dirs",
            "value" : "/data/01/yarn/container-logs"
          }, {
            "name" : "yarn_nodemanager_resource_cpu_vcores",
            "value" : "12"
          }, {
            "name" : "yarn_nodemanager_resource_memory_mb",
            "value" : "10240"
          } ]
        }, {
          "roleType" : "RESOURCEMANAGER",
          "items" : [ {
            "name" : "resource_manager_java_heapsize",
            "value" : "609222656"
          }, {
            "name" : "yarn_scheduler_maximum_allocation_mb",
            "value" : "5192"
          }, {
            "name" : "yarn_scheduler_maximum_allocation_vcores",
            "value" : "3"
          } ]
        } ],
        "items" : [ {
          "name" : "hdfs_service",
          "value" : "hdfs"
        }, {
          "name" : "rm_dirty",
          "value" : "true"
        }, {
          "name" : "rm_last_allocation_percentage",
          "value" : "75"
        }, {
          "name" : "yarn_service_cgroups",
          "value" : "false"
        }, {
          "name" : "yarn_service_lce_always",
          "value" : "false"
        }, {
          "name" : "zk_authorization_secret_key",
          "value" : "VJnSXVY92jiZb4nhZtsPNbugKfY3yO"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "yarn-JOBHISTORY-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "JOBHISTORY",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "97wnnpt4vt7bl3ft7yqxxry7l"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-40f440eb8c840f585ac24687b9bdb48c",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-2583c0dd"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "1djnjd2ndpuewk15f65xod6zk"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "bcb4p3isb5j0o5smjq83d9j2j"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-988518d4e6639f6d4b60e44f5423c504",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-2283c0da"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "1nhawsmwxmy3ztq4tn5ehw2wa"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "71ssvpjj0n6jrukjcb5chi8hy"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-e25f8245db446772bd4fc5c3ad689748",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-2383c0db"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "7c9hsm0wnvj6ae99eyupjtad9"
          } ]
        }
      }, {
        "name" : "yarn-RESOURCEMANAGER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "RESOURCEMANAGER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "rm_id",
            "value" : "113"
          }, {
            "name" : "role_jceks_password",
            "value" : "5k9rwkv5hv1x173kdnxnhglqn"
          } ]
        }
      } ],
      "displayName" : "YARN (MR2 Included)"
    }, {
      "name" : "hdfs",
      "type" : "HDFS",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "BALANCER",
          "items" : [ {
            "name" : "balancer_java_heapsize",
            "value" : "609222656"
          } ]
        }, {
          "roleType" : "DATANODE",
          "items" : [ {
            "name" : "dfs_data_dir_list",
            "value" : "/data/01/dfs/dn"
          }, {
            "name" : "dfs_datanode_data_dir_perm",
            "value" : "700"
          }, {
            "name" : "dfs_datanode_du_reserved",
            "value" : "10555378483"
          }, {
            "name" : "dfs_datanode_http_port",
            "value" : "1006"
          }, {
            "name" : "dfs_datanode_max_locked_memory",
            "value" : "4294967296"
          }, {
            "name" : "dfs_datanode_port",
            "value" : "1004"
          } ]
        }, {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "dfs_client_use_trash",
            "value" : "true"
          } ]
        }, {
          "roleType" : "JOURNALNODE",
          "items" : [ {
            "name" : "dfs_journalnode_edits_dir",
            "value" : "/data/01/dfs/jn"
          } ]
        }, {
          "roleType" : "NAMENODE",
          "items" : [ {
            "name" : "dfs_name_dir_list",
            "value" : "/data/01/dfs/nn"
          }, {
            "name" : "dfs_namenode_servicerpc_address",
            "value" : "8022"
          }, {
            "name" : "namenode_java_heapsize",
            "value" : "609222656"
          } ]
        }, {
          "roleType" : "SECONDARYNAMENODE",
          "items" : [ {
            "name" : "fs_checkpoint_dir_list",
            "value" : "/data/01/dfs/snn"
          }, {
            "name" : "secondary_namenode_java_heapsize",
            "value" : "609222656"
          } ]
        } ],
        "items" : [ {
          "name" : "dfs_encrypt_data_transfer_algorithm",
          "value" : "AES/CTR/NoPadding"
        }, {
          "name" : "dfs_ha_fencing_cloudera_manager_secret_key",
          "value" : "rHK0tcWhhTf4Slz3ivnzEAupOzbOlU"
        }, {
          "name" : "dfs_ha_fencing_methods",
          "value" : "shell(true)"
        }, {
          "name" : "dfs_namenode_acls_enabled",
          "value" : "true"
        }, {
          "name" : "fc_authorization_secret_key",
          "value" : "1y8y6r72hNH2LrKRTe3dkqHgXoka41"
        }, {
          "name" : "hadoop_security_authentication",
          "value" : "kerberos"
        }, {
          "name" : "hadoop_security_authorization",
          "value" : "true"
        }, {
          "name" : "http_auth_signature_secret",
          "value" : "u9Wx097t1I8K59GJlwLVl0gxl04G4J"
        }, {
          "name" : "rm_dirty",
          "value" : "false"
        }, {
          "name" : "rm_last_allocation_percentage",
          "value" : "25"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hdfs-BALANCER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "BALANCER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hdfs-DATANODE-40f440eb8c840f585ac24687b9bdb48c",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-2583c0dd"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "75xjslke3uqjkg5d39v8j0sjf"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "1fa1ir7x7z41dypszs7hi7ma0"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-988518d4e6639f6d4b60e44f5423c504",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-2283c0da"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "94zrex53f63lg7w5ylus2nsbv"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "95rkbof3h13d7ptdcqqp5pgbq"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-e25f8245db446772bd4fc5c3ad689748",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-2383c0db"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "6rd03p1lfias54e9za8bv7b2u"
          } ]
        }
      }, {
        "name" : "hdfs-FAILOVERCONTROLLER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "FAILOVERCONTROLLER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "d53ytrlk5ugj5nasobdxkharu"
          } ]
        }
      }, {
        "name" : "hdfs-FAILOVERCONTROLLER-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "FAILOVERCONTROLLER",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "8yl0rxi7pko254eozpv4vv476"
          } ]
        }
      }, {
        "name" : "hdfs-HTTPFS-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "HTTPFS",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "ammgoqxjpwcoqm6lwdpwnyyry"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "4awo0q0evlvcgy9n5ssa06j2k"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-988518d4e6639f6d4b60e44f5423c504",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-2283c0da"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "dm4etcagdzwyafxkuw6e0i1lb"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c3zgo2ulwn3x3vja2hi96zk8t"
          } ]
        }
      }, {
        "name" : "hdfs-NAMENODE-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "NAMENODE",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "autofailover_enabled",
            "value" : "true"
          }, {
            "name" : "dfs_federation_namenode_nameservice",
            "value" : "nameservice1"
          }, {
            "name" : "dfs_namenode_quorum_journal_name",
            "value" : "nameservice1"
          }, {
            "name" : "namenode_id",
            "value" : "115"
          }, {
            "name" : "role_jceks_password",
            "value" : "5e3evgxka2i71zwykz8hy5ycc"
          } ]
        }
      }, {
        "name" : "hdfs-NAMENODE-bc5de0eeb6b535961be5a06795940dcc",
        "type" : "NAMENODE",
        "hostRef" : {
          "hostId" : "i-2183c0d9"
        },
        "config" : {
          "items" : [ {
            "name" : "autofailover_enabled",
            "value" : "true"
          }, {
            "name" : "dfs_federation_namenode_nameservice",
            "value" : "nameservice1"
          }, {
            "name" : "dfs_namenode_quorum_journal_name",
            "value" : "nameservice1"
          }, {
            "name" : "namenode_id",
            "value" : "121"
          }, {
            "name" : "role_jceks_password",
            "value" : "24lg3r8o2qo03gzce4cm3haub"
          } ]
        }
      } ],
      "displayName" : "HDFS"
    }, {
      "name" : "sentry",
      "type" : "SENTRY",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "SENTRY_SERVER",
          "items" : [ {
            "name" : "sentry_server_java_heapsize",
            "value" : "268435456"
          } ]
        } ],
        "items" : [ {
          "name" : "hdfs_service",
          "value" : "hdfs"
        }, {
          "name" : "sentry_server_database_host",
          "value" : "cuper1.cdh.seb"
        }, {
          "name" : "sentry_server_database_password",
          "value" : "sentry"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "sentry-SENTRY_SERVER-533b55c3af4fef7c1ef8b9015f431d4f",
        "type" : "SENTRY_SERVER",
        "hostRef" : {
          "hostId" : "i-2083c0d8"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "avw06kkfc7h4ul38285s7dprs"
          } ]
        }
      } ],
      "displayName" : "Sentry"
    } ]
  } ],
  "hosts" : [ {
    "hostId" : "i-2083c0d8",
    "ipAddress" : "172.31.13.166",
    "hostname" : "cuper1.cdh.seb",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-2183c0d9",
    "ipAddress" : "172.31.13.167",
    "hostname" : "cuper2.cdh.seb",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-2283c0da",
    "ipAddress" : "172.31.13.164",
    "hostname" : "cuper3.cdh.seb",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-2583c0dd",
    "ipAddress" : "172.31.13.163",
    "hostname" : "cuper4.cdh.seb",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-2383c0db",
    "ipAddress" : "172.31.13.165",
    "hostname" : "cuper5.cdh.seb",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  } ],
  "users" : [ {
    "name" : "__cloudera_internal_user__mgmt-EVENTSERVER-533b55c3af4fef7c1ef8b9015f431d4f",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "74b2fab276f1a4dba874f6f443b5cfe29d60b6dbf3f2c4a7b03e5d9e1af5dc8b",
    "pwSalt" : 1507359275301987330,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-HOSTMONITOR-533b55c3af4fef7c1ef8b9015f431d4f",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "89a2d285b32a6d7e66af5598ee1ffbb517801689bcac46e1b2a7b3a2fe3ad52a",
    "pwSalt" : -3696247422007723533,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-REPORTSMANAGER-533b55c3af4fef7c1ef8b9015f431d4f",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "ba6778b082114af906c28d68a67982c1b4cd1d322002ca3562ea37d52407eb00",
    "pwSalt" : 4534858306989710823,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-SERVICEMONITOR-533b55c3af4fef7c1ef8b9015f431d4f",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "b44ac62833627be349b06cb68db5a7a4d1f9954537281d9610d5e22cdbd07366",
    "pwSalt" : -2250319260733998806,
    "pwLogin" : true
  }, {
    "name" : "admin",
    "roles" : [ "ROLE_LIMITED" ],
    "pwHash" : "d69245e35828a0c7f5b072359176403892de02f809d525766114bdc35766f156",
    "pwSalt" : -334874396582905629,
    "pwLogin" : true
  }, {
    "name" : "matus-cuper",
    "roles" : [ "ROLE_ADMIN" ],
    "pwHash" : "27066e05c3a7d0e6b12ca1faad4ae401317a8d52e7a6baaf1742d63e3270fffd",
    "pwSalt" : 8296395228487787272,
    "pwLogin" : true
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ],
    "pwHash" : "ed958ff6f8eeee9f8e6bf725271c6d29135cc4ffd69acd7e7bdf4b1d21a34458",
    "pwSalt" : 1543532890184919271,
    "pwLogin" : true
  } ],
  "versionInfo" : {
    "version" : "5.8.1",
    "buildUser" : "jenkins",
    "buildTimestamp" : "20160722-1141",
    "gitHash" : "a0886a893750079a4dc7f902be22d6f6e63b85a1",
    "snapshot" : false
  },
  "managementService" : {
    "name" : "mgmt",
    "type" : "MGMT",
    "config" : {
      "roleTypeConfigs" : [ {
        "roleType" : "EVENTSERVER",
        "items" : [ {
          "name" : "event_server_heapsize",
          "value" : "609222656"
        } ]
      }, {
        "roleType" : "HOSTMONITOR",
        "items" : [ {
          "name" : "firehose_heapsize",
          "value" : "609222656"
        }, {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "805306368"
        } ]
      }, {
        "roleType" : "REPORTSMANAGER",
        "items" : [ {
          "name" : "headlamp_database_host",
          "value" : "cuper1.cdh.seb"
        }, {
          "name" : "headlamp_database_name",
          "value" : "reports_manager"
        }, {
          "name" : "headlamp_database_password",
          "value" : "reports_manager"
        }, {
          "name" : "headlamp_database_user",
          "value" : "reports_manager"
        }, {
          "name" : "headlamp_heapsize",
          "value" : "609222656"
        } ]
      }, {
        "roleType" : "SERVICEMONITOR",
        "items" : [ {
          "name" : "firehose_heapsize",
          "value" : "609222656"
        }, {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "805306368"
        } ]
      } ],
      "items" : [ ]
    },
    "roles" : [ {
      "name" : "mgmt-ALERTPUBLISHER-533b55c3af4fef7c1ef8b9015f431d4f",
      "type" : "ALERTPUBLISHER",
      "hostRef" : {
        "hostId" : "i-2083c0d8"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "5lq1gtunup7236y8morccru6u"
        } ]
      }
    }, {
      "name" : "mgmt-EVENTSERVER-533b55c3af4fef7c1ef8b9015f431d4f",
      "type" : "EVENTSERVER",
      "hostRef" : {
        "hostId" : "i-2083c0d8"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "40xszpa0jmfkj4kqtvqhgy8ay"
        } ]
      }
    }, {
      "name" : "mgmt-HOSTMONITOR-533b55c3af4fef7c1ef8b9015f431d4f",
      "type" : "HOSTMONITOR",
      "hostRef" : {
        "hostId" : "i-2083c0d8"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "4jvi6s025nh6h6nvm533np2je"
        } ]
      }
    }, {
      "name" : "mgmt-REPORTSMANAGER-533b55c3af4fef7c1ef8b9015f431d4f",
      "type" : "REPORTSMANAGER",
      "hostRef" : {
        "hostId" : "i-2083c0d8"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "au3l0xnufa2rfs6kdsptjakuz"
        } ]
      }
    }, {
      "name" : "mgmt-SERVICEMONITOR-533b55c3af4fef7c1ef8b9015f431d4f",
      "type" : "SERVICEMONITOR",
      "hostRef" : {
        "hostId" : "i-2083c0d8"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "62eyw9b7hni6ks6v4e4ic9olu"
        } ]
      }
    } ],
    "displayName" : "Cloudera Management Service"
  },
  "managerSettings" : {
    "items" : [ {
      "name" : "AD_USE_SIMPLE_AUTH",
      "value" : "false"
    }, {
      "name" : "CLUSTER_STATS_START",
      "value" : "10/23/2012 9:10"
    }, {
      "name" : "KDC_ADMIN_PASSWORD",
      "value" : "BQIAAABDAAIADUNVUEVSLkNESC5TRUIADGNsb3VkZXJhLXNjbQAFYWRtaW4AAAABV+MhqAEAFwAQ6Jf8GFkO8iQ3Th9kv9hVtQ=="
    }, {
      "name" : "KDC_ADMIN_USER",
      "value" : "cloudera-scm/admin@CUPER.CDH.SEB"
    }, {
      "name" : "KDC_HOST",
      "value" : "cuper1.cdh.seb"
    }, {
      "name" : "MAX_RENEW_LIFE",
      "value" : "604800"
    }, {
      "name" : "PUBLIC_CLOUD_STATUS",
      "value" : "ON_PUBLIC_CLOUD"
    }, {
      "name" : "REMOTE_PARCEL_REPO_URLS",
      "value" : "http://cuper-repo.cdh.seb/cdh5/parcels/latest/,https://archive.cloudera.com/cdh4/parcels/latest/,http://cuper-repo.cdh.seb/impala/parcels/latest/,http://cuper-repo.cdh.seb/search/parcels/latest/,http://cuper-repo.cdh.seb/accumulo/parcels/latest/,https://archive.cloudera.com/accumulo-c5/parcels/latest/,https://archive.cloudera.com/kafka/parcels/latest/,https://archive.cloudera.com/navigator-keytrustee5/parcels/latest/,http://cuper-repo.cdh.seb/spark/parcels/latest/,http://cuper-repo.cdh.seb/sqoop-connectors/parcels/latest/"
    }, {
      "name" : "SECURITY_REALM",
      "value" : "CUPER.CDH.SEB"
    } ]
  }
}
```
