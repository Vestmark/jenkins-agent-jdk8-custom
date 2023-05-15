FROM jenkins/inbound-agent:4.9-1

USER root

RUN apt-get update && apt-get install -y curl rsync wget

WORKDIR /opt/java

RUN mkdir -p /usr/lib/jvm

RUN wget https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u275-b01/OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

RUN tar -xzf OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

RUN ln -s /opt/java/openjdk-8u275-b01 /usr/lib/jvm/jdkredhat-openjdk-1.8.0.275

RUN rm -f OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

RUN wget https://github.com/AdoptOpenJDK/openjdk11-upstream-binaries/releases/download/jdk-11.0.16%2B8/OpenJDK11U-jdk_x64_linux_11.0.16_8.tar.gz

RUN tar -xzf OpenJDK11U-jdk_x64_linux_11.0.16_8.tar.gz

RUN ln -s /opt/java/openjdk-11.0.16_8 /usr/lib/jvm/openjdk-11.0.16_8

RUN rm -f OpenJDK11U-jdk_x64_linux_11.0.16_8.tar.gz

RUN sed -i 's+$JAVA_BIN $JAVA_OPTS+/usr/lib/jvm/openjdk-11.0.16_8/bin/java $JAVA_OPTS+g'

USER jenkins
