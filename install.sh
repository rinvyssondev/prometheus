#!/usr/bin/env bash

function install_node_exporter(){
    sudo yum install wget -y && \
    wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz && \
    tar -xvf node_exporter-1.3.1.linux-amd64.tar.gz && \
    sudo mv node_exporter-1.3.1.linux-amd64 /opt/node_exporter && \
    nohup /opt/node_exporter/node_exporter &
}

install_node_exporter

function install_telnet(){
    sudo yum install telnet -y && \
    telnet 192.168.56.4 9100
}

install_telnet

function install_docker (){
    sudo yum install docker -y && \
    sudo systemctl start docker && \
    sudo chmod 666 /var/run/docker.sock
}

install_docker

function prometheus(){
    docker run -d -p 9090:9090 --privileged -v /vagrant/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
}

prometheus