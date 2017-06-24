#!/bin/bash

#initializing the varibles begins
sep="=====================================";
qu=`exim -bpc`;
malcron=`exim -bp| | grep (*) | grep -oP "(?<=\().*(?=\))" | sort | uniq -c | sort -nk1 | tail -n 10`;
count=`cat /var/log/exim_mainlog*| grep -oP "(?<=cwd\ /home\d).*(?=args) | sort |uniq -c | sort -nk1`;
#initializing the varibles ends


echo "This is a exim-check test script";
echo $sep;
echo "Checking the current exim queue:";
echo "the count is $qu";
echo $sep;
echo "\n";
echo $sep;
echo $sep;
echo "Checking for spamming occuring possibly due to malware/cron"
echo "the section gives the count of users using sendmail via scripts. 
echo $malcron;
echo $sep;
echo $sep;
echo "Cross refencing with the log files : exim_mainlog";
echo "Along with the username that is cause of mass outbount email, it will also provide the cwd's"
echo $count;
echo $sep;
echo $sep;
















