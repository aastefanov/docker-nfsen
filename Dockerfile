FROM debian:jessie
MAINTAINER Albert Stefanov <aastefanov@outlook.com>


RUN DEBIANFRONTEND=noninteractive apt-get -qq update

ADD build.sh /build.sh
ADD run.sh /run.sh
ADD nfsen.conf /nfsen.conf
RUN chmod +x /run.sh /build.sh ; sync ; sleep 1; /build.sh



WORKDIR /

ENTRYPOINT ["/run.sh"]
