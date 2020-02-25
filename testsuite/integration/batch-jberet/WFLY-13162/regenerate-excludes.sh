#!/bin/bash

mvn clean install

echo "Genereer de lijst met packagingExcludes voor de wars in project-ear..."
echo

mvn --quiet -pl org.wildfly:project-ear dependency:list -DincludeScope=runtime -DexcludeArtifactIds=project-rest -DoutputFile=/tmp/project-deps.txt
files=`cat /tmp/project-deps.txt | grep "^ " | cut -f2 -d:`
rm /tmp/project-deps.txt
sorted_files=`for i in $files ; do echo WEB-INF/lib/$i-*.jar,; done | sort`
lines=`echo "$sorted_files" | wc -l`
echo "$sorted_files" | head -n $(($lines-1))
echo "$sorted_files" | tail -n 1 | cut -f1 -d,
