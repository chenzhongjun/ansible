#! /bin/bash


sed -i 's/Server=127.0.0.1/Server=121.41.106.202/1' /etc/zabbix/zabbix_agentd.conf 
sed -i 's/# ListenPort=10050/ListenPort=10050/1' /etc/zabbix/zabbix_agentd.conf

echo "## Check ufw status ##"
ufw status | grep -e "\<active\>" &> /dev/null
if [ $? - eq 0 ]; then
    ufw allow 10050 &> /dev/null
fi
