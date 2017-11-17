ansible-playbook -i /mnt/ansible/hosts /mnt/ansible/deploy/site.yml -t audience --skip-tag config


auto add ssh-key
1. verify IP address
vim /mnt/ansible/hosts /mnt/ansible/add-ssh-key/site.yml

2. modify username
sed -i  's/username/newname/' add-ssh-key/roles/server/tasks/main.yml

3. running
alias ak='ansible-playbook -i /mnt/ansible/hosts /mnt/ansible/add-ssh-key/site.yml'
ak

