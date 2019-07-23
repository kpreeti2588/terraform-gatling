#!/bin/bash

a=0
while [ $a -lt $4 ]
do
curl -X POST \
     -F token=cd95e4d8a14e361f80b2216fe907fe \
     -F ref=$1 \
     -F variables[CONTAINER_TAG]=$5$2$a \
     -F variables[CONTAINER_NETWORK]=$2 \
     -F variables[CONTAINER_JAVA_OPTS]="$3" \
  https://git.tmaws.io/api/v4/projects/20770/trigger/pipeline
a=`expr $a + 1`
done
