# texlive base image
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <github@maxkratz.com>"

# Install prerequisites
RUN apt-get update && apt-get install -yq libfontconfig xzdec

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

# Install texlive
COPY texlive.profile .
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2016/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2016/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"
ENV PATH="/usr/local/texlive/2016/bin/armhf-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed
RUN luaotfload-tool -v -vvv -u

WORKDIR /data
CMD ["bash"]
