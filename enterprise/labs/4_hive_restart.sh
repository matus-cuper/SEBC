#!/bin/sh

# get state function
state() {
	code=`curl -X GET -s -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive | grep "serviceState" | cut -d ":" -f 2 | tr -d " \","`
	echo $code
	if [ "$code" = "STARTED" ] ; then
		return 1
	elif [ "$code" = "STOPPED" ] ; then
		return 0
	else 
		return 2
	fi
}

starthive() {
	tmp=`curl -XPOST -s -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive/commands/start`
}

stophive() {
	tmp=`curl -XPOST -s -u "matus-cuper:cloudera" http://54.158.195.196:7180/api/v12/clusters/matus-cuper/services/hive/commands/stop`
}


state

if [ $? -eq 0 ] ; then
	starthive
else
	stophive
	while [ 1 ]
	do
		state
		if [ $? -eq 2 ] ; then
			sleep 1
		else
			state
			if [ $? -eq 0 ] ; then
				starthive
			fi
			break
		fi
	done
fi 

sleep 1
state

return 0

