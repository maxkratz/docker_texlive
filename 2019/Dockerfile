# Use ubuntu 20.04
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <account@maxkratz.com>"

# Install texlive
COPY 2019/texlive.profile .
RUN wget wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2019/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2019/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed

WORKDIR /data
CMD ["bash"]
