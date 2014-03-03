#!/usr/bin/env bash

cd /elasticsearch-1.0.1

/usr/bin/supervisord &

sleep 10

# https://github.com/richardwilly98/elasticsearch-river-mongodb/
bin/plugin --install com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.0

curl -XPUT 'http://localhost:9200/_river/deal-manage-test/_meta' -d '{ 
    "type": "mongodb", 
    "mongodb": {
        "servers": [
                {"host": "itchy.allin1.cz", "port": "28000" }
        ], 
        "credentials" : [
                {"db": "admin", "user":"deal-manage-test", "password": "0uieAlWjQto1XIj" }
        ],
        "db": "deal-manage-test", 
        "collection": "deals"
    }, 
    "index": {
        "name": "deal-manage-test", 
        "type": "deal-manage" 
    }
}'

curl -XPUT 'http://localhost:9200/_river/deal-manage-production/_meta' -d '{ 
    "type": "mongodb", 
    "mongodb": {
        "servers": [
                {"host": "itchy.allin1.cz", "port": "28000" }
        ], 
        "credentials" : [
                {"db": "admin", "user":"deal-manage-test", "password": "0uieAlWjQto1XIj" }
        ],
        "db": "deal-manage-production", 
        "collection": "deals"
    }, 
    "index": {
        "name": "deal-manage-production", 
        "type": "deal-manage" 
    }
}'



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
