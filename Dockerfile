FROM rocker/r-ver:3.1

LABEL  maintainer "yyasumizu <y.yasumizu@gmail.com>"

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/mikessh/vdjtools/archive/1.1.9.zip
RUN unzip 1.1.9.zip
ENV PATH $PATH:$HOME/vdjtools-1.1.9
RUN vdjtools Rinstall
