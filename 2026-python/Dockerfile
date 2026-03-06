# texlive 2026 image
FROM maxkratz/texlive:2026
LABEL maintainer="Max Kratz <github@maxkratz.com>"

# Install Python 3.x
RUN apt-get update -q && \
    apt-get install -yq \
        python3 python3-pip

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["bash"]
