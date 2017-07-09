#!/bin/bash

echo "Choose depending on need:"

PS3='Your Choice? '

options=("01" "02" "03")

select op in "${options[@]}"

do

sep="===============================";

#this section is for making sure the files go to the right directory 
if [[ "$USER" = "root" ]];then q=$(pwd| cut -d '/' -f4); else q=$USER;fi

#in case no separate admin structure which i have seem in some cases
#use the following
#cd /; mkdir $yourusername/script.sh
#make the necessary chages for the storage paths for the text files which will be genrated

  case $op in
                "01") clear; echo "Basic troubleshooting and details"
                      count=$(exim -bpc)
                      echo "queue count is $count";;
      #eximqsumm
      #Need to check what is the best course of action for acqiring details
      #about the volumes with the username
                "02") clear; echo "Indentfy malicious activity"
      #Check for crons  
                        exim -bp | awk '{print $5}' | cut -d '(' -f2 | cut -d ')' -f1 | sort | uniq -c |awk '$1 > 50' | sort -nk1 > /admin/$q/exim.text
      #crons
                        for i in $(cat /admin/$q/exim.text | awk '{print $2}'); do echo $sep; grep -R $i /var/spool/cron/;done
      #logs
                        cd /var/log; for i in $(ls | awk '/exim/ {print $0}' | grep -v gz ); do echo "$i"; cat $i | grep -oP "(?<=cwd=/home\d).*(?=:\s\/usr)" ;done > /admin/$q/mail_via_scripts.text
      #needs to check the output for the above command. ^^^
                        echo "List of users sending scripts for above 1000 count"; cat /admin/$q/mail_via_scripts.text |cut -d '/' -f2 | awk '{print $1}' | sort | uniq -c | sort -nk1 | awk '$1 > 1000'
                        ;;

               "03") clear; echo "Full exim report at /admin/$q/exm_report"

                echo "count is $count"
                echo $sep;
                echo "The basic report is as follows:"
                exim -bp | awk '{print $4"   "$5}' |sort |uniq -c | sort -nk1
                echo $sep;

                echo "Malicious behavior:"
                echo $sep;
                cat /admin/$admin1/mail_via_scripts.text |cut -d '/' -f2 | awk '{print $1}' | sort | uniq -c | sort -nk1 | awk '$1 > 1000';
                echo $sep;

                echo "Malicious cron in /var/spool/cron"
                echo $sep
                for i in $(cat /admin/$admin1/exim.text | awk '{print $2}'); do echo $sep; grep -R $i /var/spool/cron/;done
                echo $sep

                echo "Thank you for using!!!!"

        esac
done
