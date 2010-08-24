#!/bin/sh
if [ -z $SBT_HOME ]
then
  echo "Download SBT and set the SBT_HOME environment variable to wherever you downloaded it."
  echo "http://code.google.com/p/simple-build-tool/"
  exit
fi
java -Xmx512M -jar $SBT_HOME/sbt-launch-*.jar "$@"
