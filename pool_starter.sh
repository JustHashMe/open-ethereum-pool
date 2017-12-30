#!/bin/bash


#Kill screens before we intiiate startup (just incase)
killall screen
screen -wipe
sleep 1

cd /home/%username%/open-ethereum-pool/
echo starting pirlnode
screen -LdmS pirlnode ./pirlnode --maxpeers 100  --rpc --rpcaddr 127.0.0.1 --rpcapi eth,net,web3 --unlock="%walletaddress%" --password="/home/%username%/open-pirl-pool/.walletpass"

# the file .walletpass" HAS to contain your wallet password

# Sleepy Time!
echo Sleepy Time
sleep 5

#pool2b:
echo starting Low Diff Port
screen -LdmS pirl-pool2b ./pirlpool pool2b.json

#pool2b:                                                                                                                                                
echo starting High Diff Port
screen -LdmS pirl-pool9b ./pirlpool pool9b.json 

#api:
echo starting API
screen -LdmS pirl-api ./pirlpool api.json

#unlocker:
echo starting unlocker
screen -LdmS pirl-unlocker ./pirlpool unlocker.json

#payout:
echo starting payout
screen -LdmS pirl-payout ./pirlpool payout.json

