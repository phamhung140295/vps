mkdir webchain
cd webchain
wget https://github.com/webchain-network/webchain-miner/releases/download/v2.7.0/webchain-miner-2.7.0-linux-amd64.tar.gz
tar zxvf webchain-miner-2.7.0-linux-amd64.tar.gz 
./webchain-miner -o pool.webchain.network:3333 -u 0xc876877b6853f1fd73cee5d4ff5fdfc32af6d519 -p x --thread=4
