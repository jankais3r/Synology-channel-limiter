# Synology channel limiter
Prevent your Synology router from using 2.4GHz channels above channel 11.

**Problem**: Some IoT devices only work on channels 1-11 (looking at you, [Sesame wifi adapter](https://candyhouse.co/blogs/sesame/how-to-setup-your-wi-fi-access-point))

**Solution**: Manually select channel <= 11

**Problem**: We lose all the benefits of automatic channel selection

**Solution**:
```
ssh root@192.168.1.1

echo "*       *       *       *       *       root    /bin/ash /root/channel_fix.sh" >> /etc/crontab

/usr/syno/sbin/synoservicectl --reload crond
```


![Wireless log](https://github.com/jankais3r/Synology-channel-limiter/raw/master/log.png)
