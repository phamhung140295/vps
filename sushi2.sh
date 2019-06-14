#!/usr/bin/env bash
# LICENSE
#
# This code is using the No license license.
# Which means you are allowed to use the software.
# You are not allowed the modify / copy the code without the permission from the owner.
# For more information visit: https://choosealicense.com/no-permission/
# - (c) 2018 @joewandy
# - (c) 2018 @brantje
# Copyright @ SushiPool.com 2018

echo "  _________            .__    .__                       "
echo "/   _____/__ __  _____|  |__ |__|                      "
echo "\_____  \|  |  \/  ___/  |  \|  |                      "
echo "/        \  |  /\___ \|   Y  \  |                      "
echo "/_______  /____//____  >___|  /__|                      "
echo "        \/           \/     \/                          "
echo ""
echo "__________             .__                              "
echo "\______   \____   ____ |  |                             "
echo "|     ___/  _ \ /  _ \|  |                             "
echo "|    |  (  <_> |  <_> )  |__                           "
echo "|____|   \____/ \____/|____/                           "
echo ""
echo
echo 'Installing dependencies. Please enter your sudo password if prompted.'

if ! [ -x "$(command -v node)" ]; then

    curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install -y yarn build-essential python-dev gcc g++ make nodejs wget git
fi

cd ~

if [ -d "source" ]; then
    echo 'Existing source directory found. Updating to latest SushiPool codes.'
    cd source/miner
    result=$(git pull)
    if [[ ${result} != *"Already up to date."* ]];then
        yarn
    else
        echo "No need to yarn"
    fi
else
    echo 'Cloning the latest SushiPool codes.'
    git clone https://github.com/Sushipool/source
    cd source/miner
    yarn

fi


# apply temporary WSL workaround, see https://github.com/nimiq-network/core/issues/387
if grep -q Microsoft /proc/version; then
    echo 'WSL detected, applying workaround.'
    sed -i 's/dist\/lmdb.js/dist\/leveldb.js/' node_modules/@nimiq/jungle-db/package.json
fi
HOSTNAME=$(hostname)
THREADS=$(grep -c ^processor /proc/cpuinfo)

if [ ! -f sushipool.conf ]; then
    echo "Creating config file..."
    touch sushipool.conf
    echo "{" > sushipool.conf
    echo "\"address\": \"NQ92 BE9K XJC1 RQ44 91HH YA0A 2PGQ QMD8 YD0B\"," >> sushipool.conf
    echo "\"name\": \"$HOSTNAME\"," >> sushipool.conf
    echo "\"threads\": $THREADS," >> sushipool.conf
    echo "}" >> sushipool.conf
fi


currentdir=`pwd`/

if [ ! -f "/etc/systemd/system/sushipool-miner.service" ]; then
echo "Installing service..."
cat <<- EOF > sushipool-miner.service
[Unit]
Description = sushipool-miner
After       = network.target
[Service]
ExecStart   = /bin/bash sushipool
Restart     = always
Type        = simple
NotifyAccess = main
PIDFile     = /run/sushipool-miner.pid
StartLimitInterval = 0
WorkingDirectory = $currentdir
PermissionsStartOnly = true
[Install]
WantedBy = multi-user.target
EOF
sudo mv sushipool-miner.service /etc/systemd/system/
sudo systemctl enable sushipool-miner.service
fi

cd ~
if [ ! -f /usr/local/bin/sushipool ]; then
    echo "Installing sushipool command"
    wget -O sushipool https://install.sushipool.com/sushipool.sh
    sed -ri 's|\$PATH|'"$currentdir"'|' sushipool
    sudo mv sushipool /usr/local/bin/sushipool
    chmod +x /usr/local/bin/sushipool
fi

if [ -f "nodesource_setup.sh" ]; then
    rm nodesource_setup.sh
fi
clear
echo -e "Starting SushiPool miner in a background session"
sushipool start
sushipool status
