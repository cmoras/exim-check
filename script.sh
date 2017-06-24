#!/bin/bash
#initializing the varibles
sep="=====================================";
qu=`exim -bpc`;

echo "This is a exim-check test script";
echo $sep;
echo "Checking the current exim queue:";
echo "the count is $qu";
echo $sep;
echo "\n";
echo $sep;
echo "Checking for spamming occuring possibly due to malware/cron"
exim -bp






