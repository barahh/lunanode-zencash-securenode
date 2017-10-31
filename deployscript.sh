#!/bin/bash
FQDN=$1
USER=ubuntu
zen-cli stop
cd ~/.zen
rm zen.conf
cd testnet3
rm wallet.dat
USERNAME=$(pwgen -s 16 1)
PASSWORD=$(pwgen -s 64 1)
cat <<EOF > ~/.zen/zen.conf
rpcuser=$USERNAME
rpcpassword=$PASSWORD
rpcport=18231
rpcallowip=127.0.0.1
server=1
daemon=1
listen=1
txindex=1
logtimestamps=1
### testnet config
testnet=1
EOF
echo $FQDN
sudo ~/.acme.sh/acme.sh --issue --standalone -d $FQDN 
cat <<EOF >> ~/.zen/zen.conf
tlscertpath=/home/$USER/.acme.sh/$FQDN/$FQDN.cer 
tlskeypath=/home/$USER/.acme.sh/$FQDN/$FQDN.key
EOF
zend
sleep 10
zen-cli z_getnewaddress
rm -r ~/zencash/secnodetracker/config/*
cd ~/zencash/secnodetracker
node setup