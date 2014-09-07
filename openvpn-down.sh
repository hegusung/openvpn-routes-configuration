#!/bin/sh

table="vps"

echo "deleting to $table" > /etc/openvpn/routes-down.log
echo "ip : $4" >> /etc/openvpn/routes-down.log
echo "dev : $dev" >> /etc/openvpn/routes-down.log
echo "route_vpn_gateway : $route_vpn_gateway" >> /etc/openvpn/routes-down.log

#on vide la table
ip route flush table $table

#on supprime les regles
ip rule del from $4 table $table
ip rule del to $4 table $table
ip rule del from all table $table

#suppression de la table
sed "/$table/d" /etc/iproute2/rt_tables > /etc/iproute2/rt_tables
