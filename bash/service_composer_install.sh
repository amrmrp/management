#!/bin/bash
chmod +x ./auth.sh

./auth.sh

#alias composer='/usr/bin/php7.4 /usr/local/bin/composer'

echo "Running composer install in "
docker exec -it services env COMPOSER_AUTH=$COMPOSER_AUTH bash -c "php /usr/local/bin/composer install"
echo "Done with $DIR"