# Nginx + PHP + MySql + MailHog + Redis + RabbitMQ + PHPCS + PHPCBF
You need cloning the repository.
Access the folder docker, cloned repository.


```
mkdir databases
chmod 0777 -R databases
mkdir .composer
chmod 0777 -R .composer
cd docker-m2/
```

Access the folder docker-m2.

```
cd docker
```

You can up thus, execute the command:
```
./up.sh
```

Or

```
./up.sh php56
```
Set version the PHP
```
./up.sh php73
```

If you want to down all containers. Access folder docker, and execute command:
```
sh down.sh
```


You need to have in your computer **docker, and docker-composer**

Configuration site-enabled, execute this command:

```
./config-nginx-server-name.sh
```

# PHP Code Sniffer
We have PHPCS and PHPCBF. To configure in vs code, below is cofiguration the file (.vscode/settings.json).

```
{
    "phpsab.executablePathCS": "/storage/.docker/phpcs.sh",
    "phpsab.executablePathCBF": "/storage/.docker/phpcbf.sh"
}
```

# XDebug
Use port 9001

# Executable PHP
docker/php.sh

# Mysql
**User:** root

**Password:** put in .env

**Host:** localhost

### Restore
Put your file in dumps/. Execute: 
```
./restoreDB.sh
```
When finish, command delete your files in dumps/.