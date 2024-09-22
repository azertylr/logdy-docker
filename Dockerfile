FROM alpine:latest

ENV LOGDY_VERSION=0.13.0

ADD "https://github.com/logdyhq/logdy-core/releases/download/v${LOGDY_VERSION}/logdy_linux_amd64" /usr/local/bin/logdy

RUN chmod +x /usr/local/bin/logdy

ENTRYPOINT ["/usr/local/bin/logdy"]

CMD ["--ui-ip", "0.0.0.0", "--config", "/config/logdy.json", "follow", "/var/log/access.log"]
