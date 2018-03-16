# Devops

Automated configuration of servers running Raspbian OS

# Prerequisites

* Raspberry Pi 2 or 3 with [Raspbian OS](https://www.raspberrypi.org/downloads/raspbian/) installed

## Configure your server

### preparation
```
git clone https://github.com/stuvie/devops.git
cd devops
```

1. read and customize the scripts in ``bin`` folder
1. read and customize the config files in the ``files`` folder,
certainly ``hosts``, ``resolv.conf`` and ``dhcpcd.conf``

Generally, everything you'd want to customize is at the top of each script

### Step 1: Configure server and install a few utilities
```
sudo ./bin/step1 HOSTNAME IP_ADDRESS
```
This script will create a user account, improve the security of your ssh service, setup a static IP address and install basic utilities.

When complete, reboot. Make sure system comes up with the correct hostname and IP address.

### Step 2: Install devops tools
```
sudo ./bin/step2
```
When complete, you can configure nginx, prometheus, etc.

### todo

* move scripts to ansible
* improve error handling in scripts (check args)
* add support for other operating systems
* nginx config
* monitoring tools config
