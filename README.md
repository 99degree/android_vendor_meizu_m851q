# LineageOS 17.1 rom porting for Meizu E3

Alpha ROM release is available for download, phone and data, wifi, sound are working fine:
https://github.com/99degree/android_vendor_meizu_m851q/releases

Please find the initial kernel source in below:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tag/?h=LA.UM.8.2.r1-05700-sdm660.0

And the boot.img buld since alpha 3 kernel release based on 
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tag/?h=LA.UM.8.2.r2-01900-sdm660.0

So the modified source is based at:
https://github.com/99degree/android_kernel_meizu_m851q/tree/LA.UM.8.2.r2-01900-sdm660.0?files=1

Please find the original flyme rom in need, at:
https://www.flyme.cn/firmwarelist-169.html#

Please find the Yandex Amber official LinageOS 17.1 rom below:
https://download.lineageos.org/Amber
I did E3 alpha3 release based on release (20200530). And will mainly rely on this official build onward for rom release.

The boot ramdisk is from Mokee whyred:
https://download.mokeedev.com/whyred/file/MK100.0-whyred-202001301703-NIGHTLY.zip/download
This ramdisk is for A only 2-SI boot, Without recovery. 

So for TWRP flashing, below is needed:
https://github.com/99degree/LineageOS/releases/download/20200701/recovery.img
_OR_ http://s000.tinyupload.com/?file_id=01088261345935635855

For people willing to unlock bootloader without any serect tool:
https://forum.xda-developers.com/android/development/meizu-e3-unlock-bootloader-tutorial-t4005459

phh Android 10 rom quack(v210) and upward release should also working, better with v219 to fix LCD backlight issue:
https://github.com/phhusson/treble_experimentations/releases

A friendly reminder, don't flash boot.IMG, instead, use fastboot to boot load the twrp and upload the system\vendor to /sdcard and flash. Then again do fastboot boot boot.img.clear to enter los. 

The boot.img is irregularly updated, please find the release page for download. Alpha8 release is available, please use this release or onward.  https://github.com/99degree/android_vendor_meizu_m851q/releases/tag/20200813 

# Tutorial for dev before-hand
Plz refer to https://forum.xda-developers.com/android/development/meizu-e3-lineageos-17-1-rom-porting-t4055605 for more info and comment.
(0) to make it align with latest flyme v8000 fw, update system to v8000 is highly recommended. (20200926)
(1) get the phone unlocked bootloader as above mentioned.
(2)download below mentioned fw (boot.img.signed, system.img, vendor.img, recovery.img) in to a folder like "E3_LOS17.1", unzip and get "vendor_image.emmc.win", "system_image.emmc.win" and "boot.img.signed", rename them as boot.img, system.img, recovery.img and vendor.img
(3)hold power+vol_down and do "fastboot.exe boot recovery.img"
(4)in twrp, backup all partition to /sdcard, aka, "/sdcard/system.img", "/sdcard/persist.img"
(5)in host PC backup from phone and upload all above downloaded and unzip rom.img to phone, procedure like open cmd.exe, "mkdir E3", "cd E3/", "adb.exe pull /sdcard .", "adb.exe push E3_LOS17.1 /sdcard"
(6) twrp install, choose install img, select /sdcard/E3_LOS17.1/system.img, system partition, go
(7) twrp install, choose install img, select /sdcard/E3_LOS17.1/vendor.img, vendor partition, go
(8) twrp wipe, choose data partition, go (your data partition got WIPED, all data are LOST)
(9) wait above finish, go back to PC terminal, cmd.exe, issue "adb.exe reboot-bootloader", then "fastboot.exe boot boot.img"
(10) wait for LOS17.1 boots up

optional steps
(2a) you can choose to phh's quack build instead of jasmine_sprout system image as well. download it from phh's github release channel, unpack the zip, use simg->img tool to get regenerated system.ext2.img; check with linux "file" util and get
Quote:
root@LAPTOP-U14A2O0E:/mnt/jasmine_vendor# file /mnt/c/d_drive/whyred_temp/los17_20200111_phh_system.img
/mnt/c/d_drive/whyred_temp/los17_20200111_phh_system.img: Linux rev 1.0 ext2 filesystem data, UUID=05050abd-8baa-4dd4-905c-903071f9ac68, volume name "system" (extents) (large files) (huge files)

Note:
(1)Please sure to DO backup all the partitions

(2)Please sure DO NOT to flash boot.img to boot partition, every time use fastboot to boot into LOS17.1 thus can easily restore to flyme8 rom

(3)please sure when revert back flyme8, please DO use your own twrp backup to restore all partition is your first choice. Second choise is by flyme8's recovery from recovery partition, or at least the flyme8 recovery downloaded below. DO NOT use TWRP restore the flyme rom directly, and this can avoid many issues; otherwise you are compulsively to reflash flyme once again at least and all your data partition backup become useless; and if you force restore data partition, it wont help, due to internal hw keystore and crypto salt changes. so step (5) "adb.exe pull /sdcard/ ." is essential.

(4)use twrp recovery to restore data partition might not work at all. so once again, backup by using "adb.exe pull /sdcard ." is important. As said, some partition might get changed by bootloader and internal fw, so hw crypto and salt, keystore partition might get changed too after first boot LOS17.1; and you cant backup these partition at twrp screen operation. and even through if you are expert enough, restoring those partitions in adb shell also might not work at all due to same reasoning.

(5)using "adb.exe pull /sdcard ." is important! this is important so as i said 3 times.

(6)backup all partition by "adb shell" if possible. TWRP only list some of usual partition, and some rarely used partition are not listed. Like i suffered from persist partition wiped out and cant restore without a copy. so do a "dd if=/dev/block/bootdevice/by-name/XXX of=/sdcard/XXX" is a good idea.

(7)I had tried my best to make the all mount as "r/o" as possible, but i CANT guarantee all other partition are safe. So best is do as note(6) said.

# Tutorial for unlock-phone
detailed and yt video at https://forum.xda-developers.com/android/development/meizu-e3-unlock-bootloader-tutorial-t4005459

step:

(1)get root access

(2)install terminal emulater app

(3)dump frp partition

(4)modify frp by hex editor at offset 7fff8 and 7fff to 1 (not sure 7fff8 or 7ffff take the effect, so i edit both) as frp1

(5)write frp1 back to frp partition

(6)reboot boot loader

(7)fastboot flashing unlock

(8)press up-vol or down-vol (not sure, i stop here, feedback welcome)

(9)done
