#!/bin/bash
rsync -avh --delete --progress public/ 192.168.1.164:/var/www/public/
