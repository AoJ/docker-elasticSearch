# docker Elasticsearch
#
# VERSION               1.4

FROM aooj/base:latest
MAINTAINER AooJ <aoj@n13.cz>

# install wget
RUN echo 1
RUN apt-get install -y openjdk-7-jre-headless && apt-get clean
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64


# download and unpack elasticsearch
RUN wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz -O - | tar zxvf -
# create directories with access rights for 'nobody'
RUN mkdir -m 777 elasticsearch-1.0.1/logs elasticsearch-1.0.1/data

# supervisor
ADD files/supervisord.conf /etc/supervisor/conf.d/elastic.conf


ADD files/config/ /elasticsearch-1.0.1/config/

#setup
ADD files/install.sh /opt/run/elastic.sh
RUN mkdir -p /opt/elastic
RUN echo "" > /opt/elastic/dummy.sh


EXPOSE 9200 9300
