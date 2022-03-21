#!/usr/bin/env bash
echo "Which PHP version do you want to up?"
echo "|---------------------------------------------------------------|"
echo "|Version| Description                                           |"
echo "|---------------------------------------------------------------|"
echo "| php56 | Version PHP 5.6. Settings inside the folder php56/    |"
echo "|---------------------------------------------------------------|"
echo "| php72 | Version PHP 7.2. Settings inside the folder php72/    |"
echo "|---------------------------------------------------------------|"
echo "| php73 | Version PHP 7.3. Settings inside the folder php73/    |"
echo "|---------------------------------------------------------------|"
echo "| php74 | Version PHP 7.4. Settings inside the folder php74/    |"
echo "|---------------------------------------------------------------|"
echo "| php81 | Version PHP 8.1. Settings inside the folder php81/    |"
echo "|---------------------------------------------------------------|"
read phpversion

if [ ! -d $phpversion ]; then
    echo "Version don't exist.";
    ./config-nginx-server-name.sh
fi;

echo "What's project name?"
read project_name;

echo "What's server_name? For example: http://local.local/"
read server_name;

echo "What's directory the project? For example: magento2."
read directory;

echo "Which PHP framework do you want to up?"
echo "|----------|"
echo "|Framework |"
echo "|----------|"
echo "| Magento1 |"
echo "|----------|"
echo "| Magento2 |"
echo "|----------|"
echo "| Laravel  |"
echo "|----------|"
echo "| OTHERS   |"
echo "|----------|"
read framework

if [ $framework == 'Magento1' ]; then
  echo "server {
            server_name magento2.local;
            set \$MAGE_RUN_TYPE '';
            set \$MAGE_RUN_CODE '';
            set \$MAGE_ROOT /var/www/html/$directory/;
            include     /etc/nginx/includes/magento2.conf;
        }" >> "$phpversion/nginx/sites-enabled/$project_name.conf"
  echo "Configuration finish";
elif [ $framework == 'Magento2' ]; then
  echo "server {
            server_name magento2.local;
            set \$MAGE_RUN_TYPE '';
            set \$MAGE_RUN_CODE '';
            set \$MAGE_ROOT /var/www/html/$directory/;
            include     /etc/nginx/includes/magento2.conf;
        }" >> "$phpversion/nginx/sites-enabled/$project_name.conf"
  echo "Configuration finish";
elif [ $framework == 'Laravel' ]; then
  echo "server {
            server_name magento2.local;
            set \$MAGE_ROOT /var/www/html/$directory/;
            include     /etc/nginx/includes/magento2.conf;
        }" >> "$phpversion/nginx/sites-enabled/$project_name.conf"
  echo "Configuration finish";
elif [ $framework == 'OTHERS' ]; then
  echo "server {
            server_name magento2.local;
            set \$MAGE_ROOT /var/www/html/$directory/;
            include     /etc/nginx/includes/magento2.conf;
        }" >> "$phpversion/nginx/sites-enabled/$project_name.conf"
  echo "Configuration finish";
else
  echo "Framework incorrect."
fi