---
title: "Install Nginx, PHP-FPM on Linux Mint 19"
date: 2019-06-06T20:15:32+08:00
draft: false
tags: ["setup","nginx"]
categories: ["tech"]

---
## _Install Nginx_

### Download the Nginx signing key from the official site, and the add the signning key into system.

```
$ wget http://nginx.org/keys/nginx_signing.key
$ cat nginx_signing.key | sudo apt-key add - 
```

### Add Nginx repository to the system using the below commands.
```
$ echo "deb [arch=amd64] http://nginx.org/packages/ubuntu/ bionic nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

$ echo "deb-src [arch=amd64] http://nginx.org/packages/ubuntu/ bionic nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list
```

### Update repository index.
```
$ sudo apt update
```

### Install Nginx using the following command.
```
$ sudo apt install -y nginx
```

### Test Nginx
Check the version of nginx
```
$ sudo nginx -v
nginx version: nginx/1.16.0
```
Open a web browser and hit it to, http://127.0.0.1/

---

## _Install PHP-FPM_
PHP-FPM (FastCGI Process Manager) is an alternative PHP FastCGI implementation.

### Install it by using the apt command.
```
$ sudo apt install -y php-fpm php-mysql php-cli
```

### Edit the respective php.ini depending on the PHP version you have installed on the system.
```
$ sudo vi /etc/php/7.2/fpm/php.ini
```

### set cgi.fix_pathinfo to 0.
```
$ diff php.ini php.ini.org
778c778
< cgi.fix_pathinfo=0
---
> ;cgi.fix_pathinfo=1
```

### Edit the /etc/php/7.2/fpm/pool.d/www.conf file, change `listen` from 
`listen = /var/run/php7.2-fpm.sock` to `listen = 127.0.0.1:9000`
```
$ sudo vi /etc/php/7.2/fpm/pool.d/www.conf
$ diff www.conf www.conf.org 
36c36
< listen = 127.0.0.1:9000
---
> listen = /run/php/php7.2-fpm.sock
```

# Reference:

  - https://www.itzgeek.com/how-tos/linux/linux-mint-how-tos/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-linux-mint-19.html
  - https://blog.gtwang.org/linux/nginx-php-fpm-configuration-optimization/
  - [Official documentation for nginx](http://nginx.org/en/docs/)
  - [nginx-announce mailing list](http://nginx.org/en/support.html)
  - [Commercial subscriptions for nginx](http://nginx.com/products/)

