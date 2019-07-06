#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && \
sudo apt update && \
sudo apt-get install -y gcc g++ make && \
sudo apt-get install -y nodejs && \
sudo apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget screen git && \
git clone https://github.com/anzerr/banano.miner.git miner && \
cd ~ && \
rm -rf banano.miner && \
git clone https://github.com/anzerr/banano.miner.git && \
cd banano.miner && \
sudo npm i --only=prod && \
sudo npm i --save puppeteer@1.8.0 && \
sudo node index.js ban_1equiwxxwreihqioscaoq4kufj7nogw41h43r5fjj9hn46pusgqknmuqd6zt 4 coinimp
