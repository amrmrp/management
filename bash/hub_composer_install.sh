#!/bin/bash
export COMPOSER_AUTH='{"http-basic":{"":{"username":"","password":""}}}'
# Define the base directory where your projects are located
BASE_DIR="/var/www/html"

#alias composer='/usr/bin/php7.4 /usr/local/bin/composer'

# You can create an array with specific directories, or use a wildcard to include all directories
# Example with specific directories
PROJECTS=(
    
    # application core
    "$BASE_DIR/metrics"

    # server modules
    "$BASE_DIR/modules/servers/cloud_cdn"
    "$BASE_DIR/modules/servers/is_openstack"
    "$BASE_DIR/modules/servers/is_ssl_new"

    # addone module
    "$BASE_DIR/modules/addons/system_logs"
    "$BASE_DIR/modules/addons/ssl"
    "$BASE_DIR/modules/addons/multi_registrar"
    "$BASE_DIR/modules/addons/is_pricing"
    "$BASE_DIR/modules/addons/is_reseller"
    "$BASE_DIR/modules/addons/is_emails"
    "$BASE_DIR/modules/addons/is_support"
    "$BASE_DIR/modules/addons/is_notices"
    "$BASE_DIR/modules/addons/is_servers"
    "$BASE_DIR/modules/addons/is_security"
    "$BASE_DIR/modules/addons/is_qc"
    "$BASE_DIR/modules/addons/accounting"
    "$BASE_DIR/modules/addons/is_monitor"
    "$BASE_DIR/modules/addons/is_promotion"
    "$BASE_DIR/modules/addons/is_service"
    "$BASE_DIR/modules/addons/is_sms"
    "$BASE_DIR/modules/addons/is_cdn"
    "$BASE_DIR/modules/addons/is_status"

)

# OR use a wildcard to include all directories that contain a composer.json file
# PROJECTS=("$BASE_DIR/*")

# Loop through each project directory and run composer install
for DIR in "${PROJECTS[@]}"; do
        echo "Running composer install in $DIR..."
        docker exec -it whmcs-website bash -c "cd $DIR && php /usr/local/bin/composer install"
        echo "Done with $DIR"
done