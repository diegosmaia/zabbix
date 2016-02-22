DATE=`date +%Y-%m-%d`

echo "#################### SCRIPT PARA BACKUP MYSQL ZABBIX ####################" > /backup/log/zabbix-$DATE.log
echo "diegosantosmaia@gmail.com" >> /backup/log/zabbix-$DATE.log
echo $DATE >> /backup/log/zabbix-$DATE.log
echo "#########################################################################" >> /backup/log/zabbix-$DATE.log


# Gerando arquivo sql Compactado
mysqldump --add-drop-table -uroot -psenha-admin-mysql -x -e -B zabbix | gzip -9 > /backup/mysql/zabbix-$DATE.sql.gz 


exit 0

