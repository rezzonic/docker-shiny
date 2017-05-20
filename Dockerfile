# Dockerfile to install some R packages

FROM rocker/shiny
MAINTAINER rezzonic

EXPOSE 3838

RUN rm /var/lib/apt/lists/http.debian.net_debian_dists* /var/lib/apt/lists/deb.debian.org_debian_dists*
RUN apt-get update
RUN apt-get -y install r-cran-rjava
RUN apt-get -y install libssl-dev/unstable
RUN apt-get -y install libcurl4-gnutls-dev
RUN apt-get -y install libxml2-dev
RUN apt-get clean
RUN echo 'install.packages(c("elastic","lubridate","ggplot2", "ggthemes", "plyr", "xlsx", "stringr", "reshape2", "gridExtra", "Hmisc","devtools"))' | R --no-save
RUN echo 'require(devtools);install_github("rCharts", "ramnathv")' | R --no-save

