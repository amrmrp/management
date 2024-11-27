#!/bin/bash

touch /var/www/html/metrics/logs/worker.log

touch /var/www/html/metrics/logs/worker2.log

chmod 777 /var/www/html/metrics/logs/worker.log

chmod 777 /var/www/html/metrics/logs/worker2.log

chown www-data:www-data /var/www/html/metrics/logs/worker.log

chown www-data:www-data /var/www/html/metrics/logs/worker2.log

#supervisorctl restart all

echo "done"
