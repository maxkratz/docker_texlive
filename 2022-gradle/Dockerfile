# texlive 2022 image
FROM maxkratz/texlive:2022
LABEL maintainer="Max Kratz <account@maxkratz.com>"

# Config
ARG GRADLE_VERSION=8.9

# Install OpenJDK 17
RUN apt-get update -q && \
    apt-get install -yq \
        openjdk-17-jre-headless

# Install Gradle
RUN wget -q -c https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip
RUN rm -f /opt/gradle-${GRADLE_VERSION}-bin.zip
ENV GRADLE_HOME /opt/gradle/gradle-${GRADLE_VERSION}
ENV PATH /opt/gradle/gradle-${GRADLE_VERSION}/bin:$PATH

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["bash"]
