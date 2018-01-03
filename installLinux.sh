#!/bin/bash
VERSION=1.9.2
OS=linux
ARCH=amd64

NAME_PACKAGE=go$VERSION.$OS-$ARCH.tar.gz

mkdir -p /tmp/golangInstall &&\
wget https://redirector.gvt1.com/edgedl/go/$NAME_PACKAGE -O /tmp/golangInstall/$NAME_PACKAGE &&\
cd /tmp/golangInstall &&\
tar -C /usr/local -xzf $NAME_PACKAGE

if [[ $(echo $HOME/.bash_profile | grep /usr/local/go/bin) == "" ]]; then
    echo export PATH=$PATH:/usr/local/go/bin >> ~/.bash_profile
    mkdir -p ~/go_work_dir/bin
    echo export GOPATH=$HOME/go_work_dir >> ~/.bash_profile
    echo export GOBIN=$HOME/go_work_dir/bin >> ~/.bash_profile
fi

source ~/.bash_profile
