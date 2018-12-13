#!/bin/bash -x
cp cfupdate.service /etc/systemd/system/
cp cfupdate.timer /etc/systemd/system/
cp cfupdator /usr/local/bin/
chmod +x /usr/local/bin/cfupdator

systemctl enable cfupdate.timer
systemctl start cfupdate.timer
