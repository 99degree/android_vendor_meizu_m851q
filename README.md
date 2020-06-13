# LineageOS 17.1 rom porting for Meizu E3
Please find the initial kernel source in below:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tag/?h=LA.UM.8.2.r1-05700-sdm660.0

And the latest alpha 3 kernel release based on 
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tag/?h=LA.UM.8.2.r2-01900-sdm660.0

So the modified source is at:
https://github.com/99degree/android_kernel_meizu_m851q/tree/LA.UM.8.2.r2-01900-sdm660.0?files=1

Please find the original flyme rom at:
https://www.flyme.cn/firmwarelist-169.html#

Please find the Yandex Amber official LinageOS 17.1 rom below:
https://mirrorbits.lineageos.org/full/Amber/20200607/lineage-17.1-20200607-nightly-Amber-signed.zip
I did alpha3 release based on this by this release. And will mainly rely on this onward for rom release.

The ramdisk is from Mokee whyred:
https://download.mokeedev.com/whyred/file/MK100.0-whyred-202001301703-NIGHTLY.zip/download
This ramdisk is for A only 2-SI boot, Without recovery. 

So for TWRP flashing, below is needed:
http://s000.tinyupload.com/?file_id=01088261345935635855

For people willing to unlock bootloader without any serect tool:
https://forum.xda-developers.com/android/development/meizu-e3-unlock-bootloader-tutorial-t4005459

phh Android 10 rom quack(v210) and upward release should also working, better with v219 to fix LCD backlight issue:
https://github.com/phhusson/treble_experimentations/releases
