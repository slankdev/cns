#!/bin/sh
# Stop Command: docker stop `docker ps --format '{{.Names}}' | tr '\n' ' '`
# Stop Command: docker stop R0 C0 C1
# Interface Addressing Rule: <nw-id>.<wire-id>.<vlan-id>.<link-id>/24
# Loopback Addressing Rule : 255.0.0.<host-id>/32
#
# Description: SFC network using GoBGP/GoPlane
#
#                   C0
#            (net0).2|
#                    |
#  vlan0:10.1.0.0/24 |
#                    |
#            (net0).1|
#                   R0
#            (net1).1|
#                    |
#  vlan0:10.2.0.0/24 |
#                    |
#            (net0).2|
#                   C1
#

router_img=slankdev/frr
client_img=slankdev/ubuntu:16.04
docker run -td --rm --privileged --name R0 -h R0 $router_img
docker run -td --rm --privileged --name C0 -h C0 $client_img
docker run -td --rm --privileged --name C1 -h C1 $client_img

koko=$GOPATH/bin/koko
sudo $koko -d R0,net0,10.1.0.1/24 -d C0,net0,10.1.0.2/24
sudo $koko -d R0,net1,10.2.0.1/24 -d C1,net0,10.2.0.2/24

docker exec R0 \
	vtysh -c "conf t" \
	-c "router bgp 100" \
	-c "bgp router-id 1.1.1.1" \
	-c "network 10.1.0.0/24" \
	-c "network 10.2.0.0/24"

docker exec C0 bash -c "\
	ip route del default && \
	ip route add default via 10.1.0.1"

docker exec C1 bash -c "\
	ip route del default && \
	ip route add default via 10.2.0.1"


