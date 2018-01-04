FROM ansible/centos7-ansible:latest
LABEl maintainer="linuxjosery@gmail.com"
LABEl comment="official use only"

RUN mkdir -p /mnt/ansible
COPY . /mnt/ansible/
# Default workdir 
WORKDIR /mnt/ansible

RUN baseApps='openssh-server net-tools lsof vim git' && \
    yum install -y $baseApps ; \ 
    # Allow root user long-in by remote 
    sed -i.bak 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config ; \
    # Fix vim's show by chinese 
    echo 'set encoding=utf-8' > /root/.vimrc ; \
    # Add ansible's alias and path  
    echo "alias ad='ansible-playbook -i /mnt/ansible/hosts /mnt/ansible/deploy/site.yml'" >> /root/.bashrc && \
    echo 'export PATH=$PATH:/opt/ansible/ansible/bin' >> /root/.bash_profile 
# Open openssh port
EXPOSE 22
# Init git info 
# not necessary
RUN git config --global user.name "xu.chen" && \ 
git config --global user.email "xu.chen@chiefclouds.com" 