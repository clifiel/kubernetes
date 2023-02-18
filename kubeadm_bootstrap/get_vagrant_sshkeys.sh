#!/bin/bash

# Call the script and pass all files as a parameter
# bash kubeadm_bootstrap/get_vagrant_sshkeys.sh /mnt/c/Users/cbernaldo/vagrant/lab/.vagrant/machines/Node-1/virtualbox/private_key /mnt/c/Users/cbernaldo/vagrant/lab/.vagrant/machines/Node-2/virtualbox/private_key /mnt/c/Users/cbernaldo/vagrant/lab/.vagrant/machines/Node-3/virtualbox/private_key

_copy_vagrant_private_keys(){
    FILE=$1
    NODE_NUMBER=$2

    if [ -f ${FILE} ];then        
        mkdir -p kubeadm_bootstrap/.ssh/
        cp -f ${FILE} kubeadm_bootstrap/.ssh/node${NODE_NUMBER}.id
        chmod 400 kubeadm_bootstrap/.ssh/node${NODE_NUMBER}.id
        chown $(id -u):$(id -u) kubeadm_bootstrap/.ssh/node${NODE_NUMBER}.id
    else
        echo "Arquivo nao existe."
    fi
}

_main(){
    PARAMS=$*
    NM=1
    for i in ${PARAMS};do
        _copy_vagrant_private_keys ${i} ${NM}
        ((NM=${NM}+1))
    done
}

_main $*