# Use Java 17 as base image
FROM openjdk:17-slim

# Set environment variables
ARG NESSIE_VERSION
ARG NESSIE_CLI_VERSION

ENV NESSIE_HOME=/opt/nessie

# Install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create Nessie directory
RUN mkdir -p ${NESSIE_HOME}

# Download and install Nessie CLI
RUN wget "https://github.com/projectnessie/nessie/releases/download/nessie-$NESSIE_CLI_VERSION/nessie-cli-$NESSIE_CLI_VERSION.jar" \
    -O ${NESSIE_HOME}/nessie-cli.jar

# Download and install Nessie
RUN wget "https://github.com/projectnessie/nessie/releases/download/nessie-$NESSIE_VERSION/nessie-quarkus-$NESSIE_VERSION-runner.jar" \
    -O ${NESSIE_HOME}/nessie-server.jar

# Create config directory
RUN mkdir -p ${NESSIE_HOME}/config

# Copy configuration file
COPY config/application.yaml $NESSIE_HOME/config/application.yaml
COPY init/nessie-starter.sh /usr/local/bin/nessie-starter.sh
RUN chmod +x /usr/local/bin/nessie-starter.sh

WORKDIR ${NESSIE_HOME}

# Expose Nessie port
EXPOSE 19120

ENV QUARKUS_CONFIG_LOCATIONS=${NESSIE_HOME}/config/application.yaml \
    QUARKUS_DATASOURCE_USERNAME=cagri \
    QUARKUS_DATASOURCE_PASSWORD=3541 \
    QUARKUS_DATASOURCE_JDBC_URL=jdbc:postgresql://postgres:5432/nessie_db?currentSchema=nessie \
    NESSIE_VERSION_STORE_TYPE=JDBC

# Start Nessie
CMD ["/usr/local/bin/nessie-starter.sh"]