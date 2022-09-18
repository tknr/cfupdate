#!/bin/bash -x
cd `dirname $0`
cp cfupdate.service /etc/systemd/system/
cp cfupdate.timer /etc/systemd/system/
ln -s cfupdater /usr/local/bin/
chmod +x /usr/local/bin/cfupdater

systemctl enable cfupdate.timer
systemctl start cfupdate.timer
