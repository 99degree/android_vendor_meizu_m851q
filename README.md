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
