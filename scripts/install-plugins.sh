#!/bin/bash
source .env

# download and install the Search Guard plugin to configure proxy auth
echo Installing Search Guard - aka. SC - plugin for Kibana

SC_PLUGIN_VERS=2.0.0-rc
SC_PLUGIN=/tmp/search-guard-flx-kibana-plugin.zip
SC_PLUGIN_URL=https://maven.search-guard.com/search-guard-flx-release/com/floragunn/search-guard-flx-kibana-plugin/$SC_PLUGIN_VERS-es-$STACK_VERSION/search-guard-flx-kibana-plugin-$SC_PLUGIN_VERS-es-$STACK_VERSION.zip
wget -nc -O $SC_PLUGIN $SC_PLUGIN_URL

docker run -it --rm \
    -v $CNF_DIR:/usr/share/kibana/config \
    -v $SC_PLUGIN:$SC_PLUGIN \
    docker.elastic.co/kibana/kibana:$STACK_VERSION \
    bin/kibana-plugin install file://$SC_PLUGIN


# cleanup
rm $SC_PLUGIN
