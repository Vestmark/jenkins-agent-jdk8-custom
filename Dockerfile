FROM jenkins/inbound-agent:4.9-1

USER root

RUN apt-get update && apt-get install -y curl rsync wget

WORKDIR /opt/java

RUN wget https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u275-b01/OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

RUN tar -xzf OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

RUN mkdir -p /usr/lib/jvm

RUN ln -s /opt/java/openjdk-8u275-b01 /usr/lib/jvm/jdkredhat-openjdk-1.8.0.275

RUN rm -f OpenJDK8U-jdk_x64_linux_8u275b01.tar.gz

USER jenkins