#! /bin/bash
mkdir webchain
cd webchain
wget https://github.com/webchain-network/webchain-miner/releases/download/v2.7.0/webchain-miner-2.7.0-linux-amd64.tar.gz
tar zxvf webchain-miner-2.7.0-linux-amd64.tar.gz 
./webchain-miner -o pool.webchain.network:3333 -u 0xefc1b7611f756a99d4fa31fb1950ae7c42de1b6e -p x --thread=4
