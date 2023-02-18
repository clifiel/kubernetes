#!/bin/bash

#bash kubeadm_bootstrap/set_vagrant_file.sh /mnt/c/Users/cbernaldo/vagrant/lab/

THIS_PROJECT="kubeadm_bootstrap"

_set_vagrantfile(){
    VAGRANT_PROJECT=$1

    if [ -d ${VAGRANT_PROJECT} ];then
        cp -f ${THIS_PROJECT}/Vagrantfile ${VAGRANT_PROJECT}
    else
        echo "Destino nao encontrado."
    fi
}

_main(){
    _set_vagrantfile $1
}

_main $*