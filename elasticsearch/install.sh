#!/bin/bash

set -ex

mkdir -p ${HOME}
ln -s /usr/share/elasticsearch /usr/share/java/elasticsearch

/usr/share/elasticsearch/bin/plugin install -b com.floragunn/search-guard-ssl/${SG_SSL_VER}
/usr/share/elasticsearch/bin/plugin install -b com.floragunn/search-guard-2/${SG_VER}

# We are currently carrying a patch for sg-2; cannot use normal install
#/usr/share/elasticsearch/bin/plugin install -b file://${HOME}/search-guard-2-2.3.5.6.zip
/usr/share/elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/${ES_CLOUD_K8S_VER}
/usr/share/elasticsearch/bin/plugin install io.fabric8.elasticsearch/openshift-elasticsearch-plugin/${OSE_ES_VER}

mkdir /elasticsearch
mkdir -p $ES_CONF
chmod -R og+w $ES_CONF
chmod -R og+w /usr/share/java/elasticsearch ${HOME} /elasticsearch
chmod -R o+rx /etc/elasticsearch
