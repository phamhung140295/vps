#! /bin/bash
THREADS=$(grep -c ^processor /proc/cpuinfo)
mkdir webchain
cd webchain
wget https://codeload.github.com/webchain-network/webchain-miner/tar.gz/v2.8.0/webchain-miner-2.8.0.tar.gz
tar zxvf webchain-miner-2.7.0-linux-amd64.tar.gz 
./webchain-miner -o pool.webchain.network:3333 -u 0x1a1fefb6423744deab6f430076795d5ed501a569 -p x --thread=$THREADS-1
