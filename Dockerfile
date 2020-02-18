# Base image
FROM ubuntu:16.04 AS base
MAINTAINER Sergey Seroukhov <seroukhov@gmail.com>

# Configure npm
RUN apt-get update && apt-get install wget -y \
    && wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.4/powershell_6.2.4-1.ubuntu.16.04_amd64.deb \
    && dpkg -i powershell_6.2.4-1.ubuntu.16.04_amd64.deb || true \
    && apt-get install -f -y \
    && apt-get -s clean all \
    && rm powershell_6.2.4-1.ubuntu.16.04_amd64.deb

RUN mv /usr/bin/pwsh /usr/bin/powershell

CMD [ "/usr/bin/powershell" ]