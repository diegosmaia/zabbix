dmaia@qgemonitor:~$ cat optimize-mysql.sh 
#!/bin/sh

echo -n "MySQL username: " ; read username
echo -n "MySQL password: " ; stty -echo ; read password ; stty echo ; echo

mysql -u $username -p"$password" -NBe "SHOW DATABASES;" | grep -v 'lost+found' | while read database ; do
mysql -u $username -p"$password" -NBe "SHOW TABLE STATUS;" $database | while read name engine version rowformat rows avgrowlength datalength maxdatalength indexlength datafree autoincrement createtime updatetime checktime collation checksum createoptions comment ; do
  if [ "$datafree" -gt 0 ] ; then
   fragmentation=$(($datafree * 100 / $datalength))
   echo "$database.$name is $fragmentation% fragmented."
   mysql -u "$username" -p"$password" -NBe "OPTIMIZE TABLE $name;" "$database"
  fi
done
done

