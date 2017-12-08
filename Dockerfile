# skycoin
# reference https://github.com/skycoin/skycoin
# VERSION               0.1

FROM       golang:1.9
MAINTAINER dongnan

# dirs
RUN mkdir -p $GOPATH/src/github.com/skycoin/skycoin

# github
RUN wget -c https://github.com/skycoin/skycoin/archive/v0.20.4.tar.gz

# uncompress
RUN tar zxf v0.20.4.tar.gz -C $GOPATH/src/github.com/skycoin/skycoin/ --strip-components=1

# package
RUN cd $GOPATH/src/github.com/skycoin/skycoin/cmd/skycoin && go install

# port
EXPOSE 4100 6000 6060 6420 6430

# run
CMD $GOPATH/bin/skycoin
