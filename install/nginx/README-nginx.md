# Nginx

#### References
* https://www.nginx.com/
* https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04
* https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04

---

#### Configure UFW

```
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
```

---

#### Systemctl

````
systemctl status nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl disable nginx
sudo systemctl enable nginx
```

---

#### Content
* /var/www/htm/
* /var/www/html


#### Server Configuration
* /etc/nginx/
* /etc/nginx/nginx.conf
* /etc/nginx/sites-available/
* /etc/nginx/sites-enabled/
* /etc/nginx/snippets/


#### Logs
* /var/log/nginx/access.log
* /var/log/nginx/error.log


