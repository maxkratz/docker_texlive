# texlive base image
FROM maxkratz/texlive:base
LABEL maintainer="Max Kratz <github@maxkratz.com>"

# Install texlive
COPY texlive.profile .
RUN wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz
RUN ./install-tl-*/install-tl -profile texlive.profile -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/tlnet-final/ --no-verify-downloads

# Add texlive to path
ENV PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
ENV PATH="/usr/local/texlive/2021/bin/aarch64-linux:$PATH"
ENV PATH="/usr/local/texlive/2021/bin/armhf-linux:$PATH"

# Update tlmgr + tex-packages
RUN tlmgr update --self --all --reinstall-forcibly-removed
RUN luaotfload-tool -v -vvv -u

WORKDIR /data
CMD ["bash"]
