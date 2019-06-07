#!/bin/bash
cd ~/Hugo/Sites/chaos
# hugo
rsync -avh --delete --progress public/ /var/www/public/
