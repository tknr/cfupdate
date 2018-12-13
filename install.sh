#!/bin/bash -x
ln -s cfupdate.service /etc/systemd/system/
ln -s cfupdate.timer /etc/systemd/system/
ln -s cfupdater /usr/local/bin/
chmod +x /usr/local/bin/cfupdater

systemctl enable cfupdate.timer
systemctl start cfupdate.timer
