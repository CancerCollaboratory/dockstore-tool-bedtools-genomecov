FROM ubuntu:15.04
MAINTAINER Collaboratory@OICR 
ENV VERSION=2.25.0
RUN apt-get update && apt-get install -y wget make g++ zlib1g-dev python
RUN wget -q -O bedtools2.tar.gz https://github.com/arq5x/bedtools2/releases/download/v${VERSION}/bedtools-${VERSION}.tar.gz 
RUN tar -zxvf bedtools2.tar.gz 
WORKDIR /bedtools2 
RUN make -j 2 
WORKDIR / 
RUN cp ./bedtools2/bin/bedtools ./ 
RUN strip bedtools
ENTRYPOINT ["/bedtools", "genomecov"]
