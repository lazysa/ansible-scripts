
# azkaban rc.local script
chkconfig redis on
su - azkaban -c 'sudo service redis start'
su - azkaban -c 'cd /home/azkaban/apps/azkaban-web-2.5.0/ && mkdir -p logs && sh bin/start-web.sh'
su - azkaban -c 'cd /home/azkaban/apps/azkaban-executor-2.5.0/ && mkdir -p logs && sh bin/start-exec.sh'
