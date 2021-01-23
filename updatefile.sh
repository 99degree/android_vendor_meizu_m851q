echo copying...
cd vendor
cat  ../proprietary-files.txt | xargs -I %  cp % /mnt/amber_vendor/%
chcon --reference=/mnt/amber_vendor/etc/NOTICE.xml.gz /mnt/amber_vendor/etc -R
chcon --reference=/mnt/amber_vendor/firmware/wlan /mnt/amber_vendor/firmware -R
chcon --reference=/mnt/amber_vendor/bin/grep /mnt/amber_vendor/bin/busybox
echo done!
