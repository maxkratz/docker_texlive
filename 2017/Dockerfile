# texlive base image
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <github@maxkratz.com>"

# Install dependencies
RUN apt-get update -q
RUN apt-get install -yq xzdec
RUN rm -rf /var/lib/apt/lists/*

# Install texlive
COPY texlive.profile .
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2017/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2017/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux:$PATH"
ENV PATH="/usr/local/texlive/2017/bin/aarch64-linux:$PATH"
ENV PATH="/usr/local/texlive/2017/bin/armhf-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed
RUN luaotfload-tool -v -vvv -u

WORKDIR /data
CMD ["bash"]
