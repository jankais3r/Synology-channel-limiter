#!/bin/sh

current_channel=`iwlist wlan0 channel | tail -n 2 | tr -dc '0-9'`
rand_channel=`echo $RANDOM | tail -c 2`
rand_channel=`expr $rand_channel + 1`

if [ "$current_channel" -gt 11 ]; then
	echo "info	$(date +%Y/%m/%d" "%T)	`whoami`:	Channel over 11, switching to channel $rand_channel." >> /var/log/synolog/synowireless.log
	ifconfig wlan0 down
	iwconfig wlan0 channel $rand_channel
	ifconfig wlan0 up
else
	#echo "Channel $current_channel is within the allowed range."
fi