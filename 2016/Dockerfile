# Use ubuntu 20.04
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <account@maxkratz.com>"

# Install prerequisites
RUN apt-get update && apt-get install -yq libfontconfig xzdec

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

# Install texlive
COPY 2016/texlive.profile .
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2016/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2016/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"
ENV PATH="/usr/local/texlive/2016/bin/armhf-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed

WORKDIR /data
CMD ["bash"]
