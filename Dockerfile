FROM debian:bookworm-slim

ARG BLACKFIRE_VERSION=2026.10.2
ARG TARGETARCH

RUN apt update && \
    apt install -y curl && \
    mkdir -p /tmp/blackfire && \
    curl -fsSL https://packages.blackfire.io/binaries/blackfire/${BLACKFIRE_VERSION}/blackfire-linux_${TARGETARCH}.tar.gz | tar zxp -C /tmp/blackfire && \
    mv /tmp/blackfire/blackfire /usr/bin/blackfire && \
    rm -Rf /tmp/blackfire && \
    apt clean -y && apt autoclean -y && apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/usr/bin/blackfire" ]
