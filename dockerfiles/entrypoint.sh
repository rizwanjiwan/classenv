#!/bin/sh

echo "Start entrypoint: class enviroment"
service apache2 restart
tail -f /var/log/apache2/error.log