#!/bin/bash

apt-get update
sudo apt-get -y install python-software-properties
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get install -y gcc gdb valgrind libc6-prof make pkg-config git vim libgsl0*

# Install GSL GNU numeric library
cd /tmp
wget ftp://ftp.gnu.org/gnu/gsl/gsl-1.15.tar.gz 
tar xvzf gsl-*gz 
cd gsl-1.15
./configure 
make
sudo make install


#Clone the repo

cd /home/vagrant/shared
git clone https://github.com/franleplant/SOM.c.git SOM