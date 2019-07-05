#! /bin/bash
mkdir webchain
cd webchain
wget https://github.com/webchain-network/webchain-miner/releases/download/v2.7.0/webchain-miner-2.7.0-linux-amd64.tar.gz
tar zxvf webchain-miner-2.7.0-linux-amd64.tar.gz 
./webchain-miner -o pool.webchain.network:3333 -u 0x1a1fefb6423744deab6f430076795d5ed501a569 -p x --thread=4
