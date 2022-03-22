# Nginx + PHP + MySql + MailHog + Redis + RabbitMQ + PHPCS + PHPCBF
Access the folder docker.

```
cd docker
```

You can up thus, execute the command:
```
./up.sh
```

Or

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
./config.sh --ngnix-server-name
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
- Use port 9001
- xdebug.idekey=PHPSTORM

# Executable PHP
```
./php.sh
```

# Mysql
**User:** root

**Password:** put in .env

**Host:** localhost

### Restore
Put your backup in dumps/. Execute: 
```
./config.sh --restore-db
```
When finish, command will delete your files in dumps/.

# .ENV
- CONTAINER_USER=ttescaro -> **User the container**
- DB_PASSWORD=mudar@123 -> **Password the mysql. If database exist, change the password in the MYSQL**
- RABBITMQ_DEFAULT_USER=guest -> **Username RabbitMQ**
- RABBITMQ_DEFAULT_PASS=guest -> **Password RabbitMQ**
- DIRECTORY_PROJECTS=../../ -> **Directory projects that you will clone or create. Default is same folder as docker folder**

# HOSTs
**./config.sh --ngnix-server-name** will create configuration ngnix, but You need to add you host of project in you hosts the your Operation System.
The linux or WSL the windows, the file is /etc/hosts