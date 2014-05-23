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

## Running SOM.c code

This machine will automatically download the SOM.c code inside
`shared/SOM`

To run it

```bash
vagrant up && vagrant ssh
cd shared/SOM
# compile
make
# run it
./main
```

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



## Notes about GUI

Please do not do this unless its completely necessary.
It will take about 4 hours so leave it all night.

How to add GUI to you all console VM?

```bash
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
# Update all references
sudo apt-get update
# Upgrade all installed dependencies
sudo apt-get upgrade
# Install GUI
sudo apt-get install xubuntu-desktop
```

You'll want to create a `.sh` file and let the computer do the work over a night.

You will also need to change `vagrantfile`

```ruby
  config.vm.provider :virtualbox do |vb|

    vb.gui = true
    ...
  end
```

`true` means "show Virtual box interface"

`false` means default console behavior.





Now reboot your VM with `vagrant halt` and `vagrant up`.

You should see the Virtual Box GUI and the Ubuntu GUI.


## Alternative way

Follow up the main answer to this [Stack Overflow question](http://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment).

It have tested it and it works, its much faster than the method above.

> NOTE: the credentials are vagrant/vagrant

## Better alternative way

I preffer this way because is fastest and installs a very light weight
desktop GUI but with the minium capabilities required.
It also works with Virtual Guest Additions

```bash
sudo apt-get -y install python-software-properties
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo apt-get update
sudo apt-get install build-essential linux-headers-`uname -r` dkms
sudo apt-get install xubuntu-desktop
```

It will take about 40 minutes to complete.

Make sure to install Virtual Guest Additions after this and re start your machine.

### Links

- [Add Multiverse and Universe repos](http://askubuntu.com/questions/148638/how-do-i-enable-the-universe-repository)
- [Install GUI](http://www.ubuntugeek.com/how-to-install-gui-on-ubuntu-12-04-precise-server.html)
- [Webmin](http://www.ubuntugeek.com/install-gui-in-ubuntu-server.html)