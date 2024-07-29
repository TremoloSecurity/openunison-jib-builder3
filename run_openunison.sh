#!/bin/bash

#OpenShift really doesn't like writing outside of tmp
mkdir /tmp/quartz
mkdir /tmp/amq
export CLASSPATH="/usr/local/openunison/work/webapp/WEB-INF/lib/*:/usr/local/openunison/work/webapp/WEB-INF/classes:/tmp/quartz"
echo $CLASSPATH
java -classpath $CLASSPATH $JAVA_OPTS com.tremolosecurity.openunison.undertow.OpenUnisonOnUndertow /etc/openunison/openunison.yaml
