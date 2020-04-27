#!/bin/bash

# init and sync for the first time

repo init -u repo init -u https://github.com/LineageOS/android.git -b lineage-17.1 --depth=1
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune

# sync lineageos-17.1 branch of jasmine_sprout device tree

cd ~/los/device/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_device_xiaomi_jasmine_sprout
mv android_device_xiaomi_jasmine_sprout jasmine_sprout

# sync lineageos-17.1 branch of wayne device tree

cd ~/los/device/xiaomi/
git clone https://github.com/shoukolate/android_device_xiaomi_wayne
mv android_device_xiaomi_wayne wayne

# sync lineageos-17.1 branch of sdm660-common device tree

cd ~/los/device/xiaomi/
git clone https://github.com/shoukolate/android_device_xiaomi_sdm660-common
mv android_device_xiaomi_sdm660-common sdm660-common

# sync kernel.lnx.4.4.r38-rel-wifi-safetynet-bypass branch of kernel tree

cd ~/los/kernel/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_kernel_xiaomi_sdm660 -b kernel.lnx.4.4.r38-rel-wifi-safetynet-bypass
mv android_kernel_xiaomi_sdm660 sdm660

# sync wayne vendor tree

cd ~/los/vendor/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_vendor_xiaomi_wayne
mv android_vendor_xiaomi_wayne wayne

# sync sdm660-common vendor tree

cd ~/los/vendor/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_vendor_xiaomi_sdm660-common
mv android_vendor_xiaomi_sdm660-common sdm660-common

cd ~/los/
