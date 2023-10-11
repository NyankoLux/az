# Initial setup
```
sudo su
curl https://raw.githubusercontent.com/NyankoLux/az/main/install.sh | bash
```

# Editing
```
nano /etc/supervisor/conf.d/oauth2proxy.conf
```

# Restart
```
service nginx restart
service supervisor restart
```
