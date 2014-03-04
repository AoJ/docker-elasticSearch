# Docker elastic search


- version 1.0.1
- ports are
    - 9002 (default is 9200)
    - 9003 (default is 9300)
- contains
    - river mongodb
        - https://github.com/richardwilly98/elasticsearch-river-mongodb/
    - head
        - localhost:9002/_plugin/head/
        - http://mobz.github.io/elasticsearch-head/
    - bigdesk
        - localhost:9002/_plugin/bigdesk/
        - https://github.com/lukas-vlcek/bigdesk
    - HQ
        - localhost:9002/_plugin/HQ/
        - https://github.com/lukas-vlcek/bigdesk
    - inquisitor
        - localhost:9002/_plugin/inquisitor/
        - https://github.com/polyfractal/elasticsearch-inquisitor
- install log is place in /var/log/elastic_install.log


## Usage

### in Dockerfile
    FROM aooj/elasticSearch:latest

## Contributing

### build
    git clone https://github.com/AoJ/docker-redis.git
    make build
    
### and start it
    make run

### or build, start and attach
    make debug

## TODO
- add secured proxy for plugins
- replace sleep with while
    
## Changelog
- 1.2 add install logs
- 1.1 refactor, optimize
- 1.0 first realese
