#!/bin/bash
uploadbool=false
today=`date +%Y-%m-%d.%H:%M:%S`
backupdir="backup/"

cd ~/klipper_config

git pull origin voron_v0.1017

for file in *[0-9].cfg; do
        if [ -f "$file" ] # does file exist?
        then
		   mv $file $backupdir$file
		   uploadbool=true
        fi
done

git add .
git commit -m "backup."$today
git push -u origin voron_v0.1017 --force

