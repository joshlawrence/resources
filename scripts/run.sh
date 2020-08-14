#!/bin/sh

LOGS_DIR=/etc/httpd/logs
CURRENT_LOG=$LOGS_DIR/access_log
PREVIOUS_LOG=$(ls $LOGS_DIR/access* | sort -r | head -1)

oneHourAgo=$(date -d "1 hour ago" +"%Y%m%d%H%M%S")
oneDayAgo=$(date -d "1 day ago" +"%Y%m%d%H%M%S")

fullLog=$(cat $CURRENT_LOG $PREVIOUS_LOG | grep "^[0-9]" | egrep -v "HEAD /robots.txt HTTP|GET /robots.txt HTTP|GET /favicon.ico HTTP|130.184.253.|cnixon@uark.edu|130.184.198.9|130.184.5.60|130.184.5.47|130.184.5.200|130.184.57.59|10.3.96.21|10.3.96.22|10.3.96.23|130.184.212.6|130.184.2.26|10.3.71.212")
ipAndDates=$(echo "$fullLog" | awk '{print $1 " " $4}' | awk -F'[' '{print $1 $2}' | awk -F'/' '{print $1 " " $2 " " $3}' | awk -F':' '{print $1 " " $2 $3 $4}')
ipAndFormattedDates=$(echo "$ipAndDates" | awk '{printf $1 " " $4}{printf "%02d",(match("JanFebMarAprMayJunJulAugSepOctNovDec",$3)+2)/3}{printf $2 $5 "\n"}')

pastHourCounts=$(echo "$ipAndFormattedDates" | awk -v compare="$oneHourAgo" '{if($2 >= compare){print $0}}' | cut -d' ' -f1 | sort | uniq -c | sort -nr | awk '{print $1 "  -  " $2}')
pastDayCounts=$(echo "$ipAndFormattedDates" | awk -v compare="$oneDayAgo" '{if($2 >= compare){print $0}}' | cut -d' ' -f1 | sort | uniq -c | sort -nr | awk '{print $1 "  -  " $2}')

#one request will show multiple hits lots of times because of style loading
maxPerHour=500 #average 8.33 hits per minute entire hour
maxPerDay=2500 #average 1.74 hits per minute (104.2 per hour) for entire day

pastHourExceeded=$(echo "$pastHourCounts" | awk -v compare="$maxPerHour" '{if($1 > compare){print $0}}')
pastDayExceeded=$(echo "$pastDayCounts" | awk -v compare="$maxPerDay" '{if($1 > compare){print $0}}')

if [[ -n "$pastHourExceeded" ]] || [[ -n "$pastDayExceeded" ]]
then
	sectionSeparator=$(echo "******************************************************")
	pastHourContent=$(echo "$sectionSeparator"; echo "MAXIMUM PER HOUR: $maxPerHour"; echo "$sectionSeparator"; echo "$pastHourExceeded";)
	pastDayContent=$(echo "$sectionSeparator"; echo "MAXIMUM PER DAY: $maxPerDay"; echo "$sectionSeparator"; echo "$pastDayExceeded";)
	
	messageContent=$(echo "SCRIPT SOURCE: "$0; echo; echo; echo "$pastHourContent"; echo; echo; echo "$pastDayContent" )
	currentHost=$(echo `hostname` | awk '{print toupper($0)}')
	
	echo "$messageContent" | mailx -s "$currentHost IP Address Counts" email@example.com
fi
