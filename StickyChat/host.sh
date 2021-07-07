#!/bin/bash
#
#
#
port=1337
opts="-lvnp"
SSL_crt="server.crt"
SSL_pem="server.pem"
dig @resolver4.opendns.com myip.opendns.com +short > ip.txt
your_host=`cat ip.txt`

echo -en "\e[92mStarting Listener On $port"
echo ""
echo ""

if [ ! -f server.pem ]
then
    echo "This will now attempt to help you create a key file, fill out the following!..."
    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout server.pem -out server.crt
fi
echo ""
echo "Port $port Needs To Be Open in your firewall and set up a port forwarding rule"
echo "for this host with the same port!"
echo ""
echo "Invite Someone To Join With Command:  ncat --ssl $your_host $port"
echo ""

echo "Attempting to start Server..."
while true
do
    ncat $opts $port --ssl-key $SSL_pem --ssl-cert $SSL_crt
done

bash menu.sh
