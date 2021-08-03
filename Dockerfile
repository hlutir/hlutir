FROM ubuntu:latest
LABEL MAINTAINER="Jonas Claes <jonas+docker@jonasclaes.be>"

WORKDIR /workspace

# Setup users and groups
RUN useradd dev -d /home/dev -m -s /bin/bash \
    && echo "dev:dev" | chpasswd \
    && usermod -aG sudo dev \
    && chown dev:dev /workspace -R \
    && chmod ug+rwx /workspace -R

# Install all dependencies.
RUN apt-get update \
    && apt-get install -y git curl sudo build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

USER dev

# CMD [ "/bin/bash" ]