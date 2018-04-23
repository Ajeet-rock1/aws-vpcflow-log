#!/bin/bash

m1=`/usr/local/bin/s3cmd ls s3://vpc-logs/exportedlogs/*`
m4=$(echo $m1 | tr "DIR " "\n" | tr " " "\n")
#m5=$(echo $m4 | tr " " "\n")
echo $m4 >> /opt/script/t7.txt

m2=eni-*
m3=$m4$m2
#printf "$m3"
file1=`/usr/local/bin/s3cmd ls $m3`
#file1=`/usr/local/bin/s3cmd ls s3://vpc-logs/exportedlogs/be66aa4b-8262-47a6-b480-49798afcf01d/eni-*`
#`/usr/local/bin/s3cmd get s3://remote-hub/VPCFlowLog/15dca871-c9c6-4703-9d85-17f80d982aad/eni-0352bc6b-all/000000.gz
t1=$(echo $file1 | tr "DIR " "\n")

for addr in $t1
do
  echo  $addr >> /opt/script/t3.txt
done

file2=*.gz
file=/opt/script/t3.txt
cat $file | while read line;  
do
#printf "$line"
T3=$line$file2
/usr/local/bin/s3cmd get $T3
gunzip -f *.gz
cat 000000 >> /var/log/vpc/vpc.log
rm -rf *.gz
rm -rf 000000
done > /opt/script/t9.txt
rm -rf /opt/script/t3.txt
#rm -rf t7.txt
/usr/local/bin/s3cmd del -r $m4
