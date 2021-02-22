# Nginx + PHP + MySql + MailHog + Redis + PHPCS
You need cloning the repository.
Access the folder .docker.


```
mkdir databases
chmod 0777 -R databases
mkdir .composer
chmod 0777 -R .composer
cd docker-m2/
```

After, You need to create containers, below the code:
```
docker-composer up -d
```

You need to have in your computer **docker, and docker-composer**

You need to add config the your project in: **docker-m2/config/nginx/sites-enabled**

For exemplo: **docker-m2/config/nginx/sites-enabled/default_m2.conf**
```
server {
    server_name docker.m2.local;
    set         $store '';
    set $MAGE_ROOT /var/www/html/;
    include     /etc/nginx/includes/magento2.conf;
}
```

Your projects must be at the same root as the docker-m2 folder.

For exemplo:
```
.
..
docker-m2
project-magento-2
```

# PHP Code Sniffer
We have two PHPCS. The phpcs56.sh and phpcs73.sh. To configure in vs code, below is cofiguration the file (.vscode/settings.json).

```
{
    "phpcs.executablePath": "/storage/.docker/php73cs.sh"
}
```

# XDebug
Use port 9001

# Executable PHP
docker-m2/php73.sh