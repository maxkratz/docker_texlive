# Use ubuntu 20.04
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <account@maxkratz.com>"

# Install texlive
COPY 2021/texlive.profile .
RUN wget http://ctan.mirror.norbert-ruehl.de/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile

# Add texlive to path
ENV PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed

WORKDIR /data
CMD ["bash"]
