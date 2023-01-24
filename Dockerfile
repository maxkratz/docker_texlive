#
# Base image
#

# Use ubuntu 22.04
FROM ubuntu:22.04
LABEL maintainer="Max Kratz <account@maxkratz.com>"
ENV DEBIAN_FRONTEND=noninteractive

# Update and install various packages
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq \
        wget build-essential lsb-release locales \
        bash-completion tzdata gettext-base curl git \
        zip unzip

# Use en utf8 locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Install depencencies
RUN apt-get install -y perl wget

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

CMD ["bash"]
