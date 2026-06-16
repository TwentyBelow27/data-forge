# Этап 1: скачиваем curl и jq
FROM alpine:latest AS downloader
RUN apk add --no-cache curl
RUN curl -L -o /usr/local/bin/jq https://github.com/jqlang/jq/releases/latest/download/jq-linux64 && chmod +x /usr/local/bin/jq

# Этап 2: финальный образ
FROM confluentinc/cp-schema-registry:latest
USER root
COPY --from=downloader /usr/bin/curl /usr/local/bin/curl
COPY --from=downloader /usr/local/bin/jq /usr/local/bin/jq

COPY schemas/ /opt/schemas/
COPY init-schemas.sh /opt/init-schemas.sh
COPY entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/init-schemas.sh /opt/entrypoint.sh

USER appuser
ENTRYPOINT ["/opt/entrypoint.sh"]
