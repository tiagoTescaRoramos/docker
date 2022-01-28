# Nginx + PHP + MySql + MailHog + Redis + PHPCS
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

After, Access the folder you want, each folder is PHP version with some configuration.

After, You need to create containers, below the code:
```
sh up.sh
```

Or

You can up thus, access folder docker and execute the command:

```
./up.sh php56
```
or
```
./up.sh php73
```
or
```
./up.sh php74
```

If you want to down all containers. Access folder docker, and execute command:
```
sh down.sh
```


You need to have in your computer **docker, and docker-composer**

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

**Password:** 1234qwer

**Host:** localhost