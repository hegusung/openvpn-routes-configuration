#!/bin/sh

table="vps"

echo "pushing new routes to $table" > /etc/openvpn/routes.log
echo "ip : $4" >> /etc/openvpn/routes.log
echo "dev : $dev" >> /etc/openvpn/routes.log
echo "route_vpn_gateway : $route_vpn_gateway" >> /etc/openvpn/routes.log
echo "route_net_gateway : $route_net_gateway" >> /etc/openvpn/routes.log
echo "serveur distant : $trusted_ip" >> /etc/openvpn/routes.log

#ajout de la table
echo "1 $table" >> /etc/iproute2/rt_tables

#on vide la table
ip route flush table $table

#ajout des routes
ip route add table $table $4 dev $dev proto kernel scope link  src $4
ip route add table $table default via $route_vpn_gateway dev $dev
ip route add table $table $trusted_ip via $route_net_gateway dev eth0

#ajout des regles
ip rule add prio 50 from $4 table $table
ip rule add prio 50 to $4 table $table

ip rule add prio 32000 from all table $table

