FROM ubuntu:14.04

MAINTAINER Wiktor <wiktor@metacode.biz>

RUN apt-get update && \
	apt-get install --assume-yes software-properties-common python-software-properties && \
	add-apt-repository ppa:git-core/ppa && \
	apt-get update && \
	apt-get install --assume-yes git liblzma-dev build-essential gcc

COPY . /code/

WORKDIR /code

ENV BASEURL tftp://10.0.2.4/loader.ipxe

RUN make

CMD ["cat", "/code/loader.pxe"]
