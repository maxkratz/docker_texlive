# texlive base image
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <account@maxkratz.com>"

# Install texlive
COPY texlive.profile .
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2022/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2022/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
ENV PATH="/usr/local/texlive/2022/bin/aarch64-linux:$PATH"
ENV PATH="/usr/local/texlive/2022/bin/armhf-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed
RUN luaotfload-tool -v -vvv -u

WORKDIR /data
CMD ["bash"]
