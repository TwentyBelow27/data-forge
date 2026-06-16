FROM debezium/connect:3.0.0.Final

USER root

# Устанавливаем unzip (больше не нужен для avro-конвертера, оставлен на случай других нужд)
RUN microdnf install -y unzip \
 && mkdir -p /kafka/connect/apicurio-avro-converter \
 && curl -fsSL \
    https://repo1.maven.org/maven2/io/apicurio/apicurio-registry-distro-connect-converter/2.5.11.Final/apicurio-registry-distro-connect-converter-2.5.11.Final.jar \
    -o /kafka/connect/apicurio-avro-converter/apicurio-registry-distro-connect-converter-2.5.11.Final.jar \
 && microdnf clean all

COPY config /kafka/connectors
COPY start-with-connectors.sh /usr/local/bin/start-with-connectors.sh

RUN chmod +x /usr/local/bin/start-with-connectors.sh \
 && chown -R kafka:kafka /kafka/connectors /usr/local/bin/start-with-connectors.sh

USER kafka

ENTRYPOINT ["/usr/local/bin/start-with-connectors.sh"]
