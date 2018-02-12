#!/bin/bash

# A maven xml file is required for this runtime.
if [ ! -e /openbrisk/$MODULE_NAME.xml ]
then
    echo "No maven file (${MODULE_NAME}.xml) found."
    exit 1
fi

rm -rf pom.xml
rm -rf target/

# Build the function.
mvn install -f /openbrisk/$MODULE_NAME.xml
cp /openbrisk/target/$MODULE_NAME*-jar-with-dependencies.jar /openbrisk/$MODULE_NAME.jar && rm -rf /openbrisk/target

# Run the server.
java -jar runtime.jar