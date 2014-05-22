SOM-box for C language
======================


This will install a Virtual Machine running Ubuntu 12.04 32 bits
and a ready for user development environment for **C**

## Pre Requisites

Download and Install

1. [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://www.vagrantup.com/downloads.html)


**Note about issues in Windows**

If when you type `vagrant up` you get the an error regarding `VBoxManage` then here is the solution:

1. Find out where VirtualBox has been installed (In my pc it was: `C:\Program Files\Oracle\VirtualBox`)
2. Copy the path and add it to `path` environment variable


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

## Access the Virtual Machine

```bash
cd SOM-box
vagrant up && vagrant ssh
```

`vagrant up` turns on the virtual machine.

`vagrant ssh` gets you inside the VM console.


## Shared folders

The `shared` directory in your host machine is synced with `home/vagrant/shared` directory
in your guest machine (VM) so you can work with the files inside your VM directly in windows 


## Test your installation

```bash
vagrant up && vagrant ssh
cd shared/hello_world
cat README.md
```

You'll see the instructions there.



## Common tasks withing Linux


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


### Note about backticks

Sometimes in your makefiles you'll need to run something like

```bash
`pkg-config --libs gsl`
```

if you detect that it does not evaluate your should use this syntax instead

```bash
$(shell pkg-config --libs gsl)
```