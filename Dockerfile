
# Elasticsearch
#
# VERSION               0.0.1
FROM barnybug/openjdk-7-jre
MAINTAINER AooJ <aooj@n13.cz>

# install wget
RUN apt-get install -y dialog curl wget openssh-server supervisor && apt-get clean

# download and unpack elasticsearch
RUN wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz -O - | tar zxvf -
# create directories with access rights for 'nobody'
RUN mkdir -m 777 elasticsearch-1.0.1/logs elasticsearch-1.0.1/data

# supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# ssh
RUN mkdir /var/run/sshd
RUN mkdir -p /root/.ssh
ADD authorized_keys root/.ssh/authorized_keys
RUN chown root:root root/.ssh/authorized_keys

#setup
ADD setup.sh /opt/run/setup.sh
ADD start.sh /opt/run/start.sh
RUN chmod +x /opt/run/start.sh /opt/run/setup.sh
RUN ["/opt/run/setup.sh"]

# USER nobody
EXPOSE 9200 9300 22
CMD /opt/run/start.sh
# CMD ["/usr/bin/supervisord"]
# CMD ["elasticsearch-1.0.1/bin/elasticsearch"]
