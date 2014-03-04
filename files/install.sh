#!/usr/bin/env bash

cd /elasticsearch-1.0.1
LOG=/var/log/install_elastic.log
touch $LOG

/usr/bin/supervisord > /dev/null &

sleep 10s

# https://github.com/richardwilly98/elasticsearch-river-mongodb/
bin/plugin --install com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.0  | tee >(cat >> $LOG) | tail -n 1


# http://mobz.github.io/elasticsearch-head/
bin/plugin -install mobz/elasticsearch-head | tee >(cat >> $LOG) | tail -n 1


# https://github.com/lukas-vlcek/bigdesk
# 9200/_plugin/bigdesk
bin/plugin -install lukas-vlcek/bigdesk/2.4.0 | tee >(cat >> $LOG) | tail -n 1

# http://www.elastichq.org/index.html
# 9200/_plugin/HQ/
bin/plugin -install royrusso/elasticsearch-HQ | tee >(cat >> $LOG) | tail -n 1

# https://github.com/polyfractal/elasticsearch-inquisitor
# 9200/_plugin/inquisitor/
bin/plugin -install polyfractal/elasticsearch-inquisitor | tee >(cat >> $LOG) | tail -n 1

/etc/init.d/supervisor stop

sleep 3s
