#!/bin/bash
echo We assume that sourceanalyzer is in your local path
echo If it is not, update your path to include SCA.
echo ANT should also be installed on your local machine.


echo Cleaning up...
ant clean
sourceanalyzer -b riches -clean

echo Translating and Scanning...
ant all

sourceanalyzer -findbugs -cp "jsplibs/**/*.jar:lib/**/*.jar:WEB-INF/lib/**/*.jar" -source 1.5 -java-build-dir "WEB-INF/classes" WEB-INF/ js/ jsplibs/ login/ pages/ config/ -f scanResults.fpr
