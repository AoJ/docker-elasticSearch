#!/usr/bin/env bash

cd /elasticsearch-1.0.1

/usr/bin/supervisord &

sleep 10

# https://github.com/richardwilly98/elasticsearch-river-mongodb/
bin/plugin --install com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.0


# http://mobz.github.io/elasticsearch-head/
bin/plugin -install mobz/elasticsearch-head


# https://github.com/lukas-vlcek/bigdesk
# 9200/_plugin/bigdesk
bin/plugin -install lukas-vlcek/bigdesk/2.4.0

# http://www.elastichq.org/index.html
# 9200/_plugin/HQ/
bin/plugin -install royrusso/elasticsearch-HQ

# https://github.com/polyfractal/elasticsearch-inquisitor
# 9200/_plugin/inquisitor/
bin/plugin -install polyfractal/elasticsearch-inquisitor


/usr/bin/supervisorctl stop all
