# Base image
FROM ubuntu:16.04 AS base
MAINTAINER Sergey Seroukhov <seroukhov@gmail.com>

# Configure npm
RUN apt-get update && apt-get install wget -y \
    && wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-beta.7/powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb \
    && dpkg -i powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb || true \
    && apt-get install -f -y \
    && apt-get -s clean all \
    && rm powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb 

CMD [ "/usr/bin/powershell" ]