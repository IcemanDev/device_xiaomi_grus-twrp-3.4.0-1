# android_device_xiaomi_grus

Android 9 and 10 TWRP device tree for Xiaomi Mi9SE (codname: grus).

Integrated root system.

Building with Omni (9.0) repo or LineageOS (16.0) repo (it doesn't matter).

mkdir your_twrp_folder

cd ~/your_twrp_folder

repo init -u https://github.com/LineageOS/android.git -b lineage-16.0

or

repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0

repo sync

To compile:

```
cd ~/your_twrp_folder

. build/envsetup.sh

breakfast grus eng

mka adbd recoveryimage | tee twrp.log

or single command (copy/paste in terminal):

. build/envsetup.sh && breakfast grus eng && rm -rf out && make clean && mka adbd recoveryimage | tee twrp.log

```
If you want to build TWRP and kernel you need to flag TARGET_PREBUILT_KERNEL in the BoardConfig.mk file (#TARGET_PREBUILT_KERNEL) and download the kernel source code.

Kernel source: https://github.com/pengus77/kowalski-grus

cd ~/your_twrp_folder

git clone --depth=1 https://github.com/pengus77/kowalski-grus.git -b dev-q kernel/xiaomi/grus