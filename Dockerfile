FROM rocker/r-ver:3.1

LABEL  maintainer "yyasumizu <y.yasumizu@gmail.com>"

RUN apt-get update && apt-get install -y wget 
# RUN apt-get install openjdk-8-jdk
# RUN apt-get install apt-file && apt-file update && apt-get install software-properties-common
# RUN add-apt-repository ppa:webupd8team/java && 

RUN \
    echo "===> add webupd8 repository..."  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update


RUN echo "===> install Java"  && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default

RUN wget https://github.com/mikessh/vdjtools/releases/download/1.1.9/vdjtools-1.1.9.zip
RUN unzip 1.1.9.zip
ENV PATH $PATH:$HOME/vdjtools-1.1.9

RUN vdjtools Rinstall
