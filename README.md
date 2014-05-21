SOM-box for C language
======================


This will install a Virtual Machine running Ubuntu 12.04 32 bits
and a ready for user development environment for **C**

## Pre Requisites

Download and Install

1. [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://www.vagrantup.com/downloads.html)


## Open the terminal and type:

```bash
git clone https://github.com/franleplant/SOM-box.git SOM-box
cd SOM-box
vagrant up && vagrant ssh
```

This will install everything you need to work with the project:
Ubuntu, gcc, vim, git, some other useful libraries.


> This process might take a while since its need to download
a fresh copy of Ubuntu 12.04 (250 MB).

##Access the Virtual Machine

```bash
cd SOM-box
vagrant up && vagrant ssh
```

`vagrant up` turns on the virtual machine.

`vagrant ssh` gets you inside the VM console.



### Install dependencies

Use `apt-get` package manager heavily.

```bash
sudo apt-get install lib_name
```

### Search for packages 

You can search for packages like this:

```bash
sudo apt-get update
apt-cache search keywords
```


### Check if you have a particular package installed

```bash
dpkg --get-selections | grep 'package_name'
```
Let `'package_name'` be the first n letters of the package name