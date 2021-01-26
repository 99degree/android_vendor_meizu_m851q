echo copying...
cd vendor
cat  ../proprietary-files.txt | xargs -I %  cp % /mnt/amber_vendor/%
chcon --reference=/mnt/amber_vendor/etc/NOTICE.xml.gz /mnt/amber_vendor/etc -R
chcon --reference=/mnt/amber_vendor/firmware/wlan /mnt/amber_vendor/firmware -R
chcon --reference=/mnt/amber_vendor/bin/grep /mnt/amber_vendor/bin/busybox
chcon --reference=/mnt/amber_vendor/bin/init.qcom.sh /mnt/amber_vendor/bin/init.class_main.sh
chcon --reference=/mnt/amber_vendor/lib /mnt/amber_vendor/lib/libmmcam*
chcon --reference=/mnt/amber_vendor/lib /mnt/amber_vendor/lib/libchrom*
chcon --reference=/mnt/amber_vendor/lib /mnt/amber_vendor/lib/libactu*
#u:object_r:qti_init_shell_exec:s0 
#init.class_main.sh
echo done!
