#!/bin/env bash
# Add a user's ssh key to Server

if [ $# -ne 1 ]; then
    echo "Usage: $0 USERNAME"	
    exit -1
fi

USERNAME="$1"
#CLASS="$2"
SSH_KEY_FILE='./all_ssh_key'
SSH_KEY=$(grep "^$USERNAME" $SSH_KEY_FILE | cut -d: -f2)


useradd "$USERNAME" && mkdir -p /home/"$USERNAME"/.ssh
echo "$SSH_KEY" >> /home/"$USERNAME"/.ssh/authorized_keys
#echo "$USERNAME ALL=(ALL)       NOPASSWD:ALL" >> /etc/sudoers


