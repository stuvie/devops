# devops

automated configuration of servers running Raspbian OS

## usage

### step 2: customization

1. read and customize the scripts in ``bin`` folder
1. read and customize the config files in the ``files`` folder

### step 1: create users, secure sshd, setup static IP address, install a few utilities
```
git clone https://github.com/stuvie/devops.git
cd devops
sudo ./bin/step1 HOSTNAME
```
when complete, you can reboot

### step 2: install devops tools
```
sudo ./bin/step2
```
when complete, you can configure nginx, icinga2, etc.

### todo

* move scripts to ansible
* improve error handling in scripts (check args)
* add support for other operating systems
* nginx config
* monitoring tools config
