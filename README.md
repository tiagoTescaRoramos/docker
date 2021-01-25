# Nginx + PHP + MySql + MailHog + Redis + PHPCS
You need cloning the repository.
Access the folder .docker.

```
cd docker-m2/
```

After, You need to create containers, below the code:
```
docker-composer up -d
```

You need to have in your computer **docker, and docker-composer**

# PHP Code Sniffer
We have two PHPCS. The phpcs56.sh and phpcs73.sh. To configure in vs code, below is cofiguration the file (.vscode/settings.json).

```
{
    "phpcs.executablePath": "/storage/.docker/php73cs.sh"
}
```