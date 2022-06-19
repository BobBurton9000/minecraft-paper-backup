#!/bin/bash
name=$(date '+%Y-%m-%d_%H-%M-%S')
tar -zcv /home/minecraft/save/world /home/minecraft/save/world_nether /home/minecraft/save/world_the_end /home/minecraft/whitelist.json | pv -L 3m > "world-$name.tar.gz"
s3cmd -c /home/backup/s3cfg put world-$name.tar.gz s3://nerdrealm/ltn/world-$name-tar.gz