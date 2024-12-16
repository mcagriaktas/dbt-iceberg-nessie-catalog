#!/bin/bash

# Start Nessie server
java -Dquarkus.config.file=$NESSIE_HOME/config/application.yaml -jar $NESSIE_HOME/nessie-server.jar

# Wait for server to start (30 seconds should be enough)
#echo "Waiting for server to start..."
#sleep 10

# Create branch
#java -jar $NESSIE_HOME/nessie-cli.jar -u http://localhost:19120/api/v2 -c 'create branch jaffle_shop_branch'