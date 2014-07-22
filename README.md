openvpn-routes-configuration
============================

While openvpn is running, every packets comming from another computer which is not in your local network will receive an answer through the vpn, and the connection won't be established.

This little script changes the computer's routes in order to correct this issue.

Install
-------

Simply clone this repository, you can for example do it in your openvpn repository.

    $ cd /etc/openvpn
    $ git clone https://github.com/Fr3ya/openvpn-routes-configuration.git
    
How to use
----------

add these lines a the end of your openvpn configuration file

    ; Don't add routes
    route-noexec
    
    script-security 2
    up "/etc/openvpn/openvpn-routes-configuration/openvpn-up.sh"
    down "/etc/openvpn/openvpn-routes-configuration/openvpn-down.sh"   
