FROM debian:bookworm-slim

RUN apt update && \
    apt install -y curl && \
    mkdir -p /tmp/blackfire && \
    architecture=$(uname -m) && \
    curl -A "Docker" -L https://blackfire.io/api/v1/releases/cli/linux/$architecture | tar zxp -C /tmp/blackfire && \
    mv /tmp/blackfire/blackfire /usr/bin/blackfire && \
    rm -Rf /tmp/blackfire && \
    apt clean -y && apt autoclean -y && apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/usr/bin/blackfire" ]
