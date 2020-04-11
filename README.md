# Devops

Automated configuration of systems running MacOS or Raspbian Linux

# Prerequisites

* Apple system with the latest MacOS installed
* Raspberry Pi 2, 3 or 4 with [Raspbian OS](https://www.raspberrypi.org/downloads/raspbian/) installed

## Configure your system

### preparation
```
git clone https://github.com/stuvie/devops.git
cd devops
```

1. read and customize the scripts in the ``bin`` folder
1. read and customize the config files in the ``files`` folder,
certainly ``hosts``, ``resolv.conf`` and ``dhcpcd.conf``

Generally, everything you'd want to customize is at the top of each script

### Step 1: Configure system and install a few utilities
```
sudo ./bin/step1 HOSTNAME IP_ADDRESS
```
For example:
```
sudo ./bin/step1 pi0.fywss.com 10.20.1.40 | tee step1.out
sudo ./bin/step1 pi2.fywss.com 10.20.1.42 | tee step1.out
sudo ./bin/step1 pi3.fywss.com 10.20.1.43 | tee step1.out
sudo ./bin/step1 pete.fywss.com 10.20.1.41 | tee step1.out
```
This script will make a backup copy of ``/etc`` under ``/bak/fresh``, create an admin user account (steve, by default) and improve the security of your ssh service by disabling password authentication.

On Linux, it will also install core utilities via ``apt-get`` and setup a static IP address. When complete, reboot. Make sure system comes up with the correct hostname and IP address.

### Step 2: Install development and ops tools
On MacOS, step2 installs packages via ``brew``, which must not be run as root:

```
./bin/step2
```
On Linux, step2 installs packages for configuring and monitoring a system:

```
sudo ./bin/step2
```
When complete, you can configure nginx, prometheus, etc.

After step2, the system should be configured via ansible.

## Moving to Ansible

### Modify ansible.cfg and inventory

Modify the `inventory` file to suit your environment. Change the hostnames to your liking.

If your SSH user on the Raspberry Pis are not the Raspbian default `pi` user modify `remote_user` in the `ansible.cfg`.

### Confirm ansible is working with your servers

```
ansible -m ping all
ansible -m ping master
```

### Deploy Tools and Toys

```
ansible-playbook common.yml
ansible-playbook toys.yml
ansible-playbook debug.yml
```

## Todo

* expand ansible playbooks
* nginx ssl config should use template
* add support for other operating systems
* monitoring tools configuration
