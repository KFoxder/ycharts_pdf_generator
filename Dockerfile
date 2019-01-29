FROM ubuntu:18.04

# Update apt universe
RUN sed "s/main$/main universe/" -i /etc/apt/sources.list

# Update cache
RUN apt-get update

# Install required packages
RUN apt-get install -y \
    xvfb \
    ca-certificates \
    xfonts-75dpi \
    fontconfig \
    xfonts-base \
    libxrender1 \
    libfontconfig1 \
    libssl-dev \
    libjpeg-turbo8

# Install wkhtmltopdf
ADD packages/wkhtmltox_0.12.5-1.bionic_amd64.deb /usr/tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN chmod 755 /usr/tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN dpkg -i /usr/tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN apt-get install -f

# Add startup script
ADD scripts/startup /usr/bin/startup
RUN chmod 755 /usr/bin/startup
