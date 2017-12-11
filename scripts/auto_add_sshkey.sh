#!/bin/env bash

if [ $# -ne 4 ]; then 
    echo "Usage: $0 <ServerName> <Host:IPAddress> <UserName> <Mode:install|remove|log_install|log_remove>" 
    exit -1
fi

ServerName=$1
Host=$2
UserName=$3
Mode=$4
AnsibleHostConf='/mnt/ansible/add-ssh-key/hosts'
SiteConf='/mnt/ansible/add-ssh-key/site.yml'
GroupVarsConf='/mnt/ansible/add-ssh-key/group_vars/all'


echo -e "[$ServerName]\n$Host" > $AnsibleHostConf 
sed -i.bak "s/\(^ssh_user:\).*/\1 $UserName/" $GroupVarsConf
sed -i.bak "s/\(^- hosts:\).*/\1 $ServerName/" $SiteConf


function KEY_INSTALL () { 
	ansible-playbook -i $AnsibleHostConf $SiteConf -t install
}

function LOG_INSTALL () { 
	ansible-playbook -i $AnsibleHostConf $SiteConf -t log_install
}

function KEY_REMOVE () {
	ansible-playbook -i $AnsibleHostConf $SiteConf -t remove
}

function LOG_REMOVE () {
	ansible-playbook -i $AnsibleHostConf $SiteConf -t log_remove
}

if [ $Mode == "remove" ] ; then 
	KEY_REMOVE;
elif [ $Mode == "install" ]; then   
	KEY_INSTALL;
elif [ $Mode == "log_install" ]; then   
	LOG_INSTALL;
else 
	LOG_REMOVE;
fi

