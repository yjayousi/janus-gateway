FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update

RUN apt-get install -y apt-transport-https cmake

RUN apt-get -y install libmicrohttpd-dev libjansson-dev \
	libssl-dev libsrtp2-dev libsofia-sip-ua-dev libglib2.0-dev \
	libopus-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev \
    libnice-dev \
	libconfig-dev pkg-config libtool automake


RUN mkdir /app
WORKDIR /app

COPY . .

RUN sh autogen.sh
RUN ./configure --prefix=/opt/janus
RUN make
RUN make install
RUN make configs