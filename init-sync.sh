#!/bin/bash

# init and sync for the first time

repo init -u https://github.com/FlokoROM/manifesto.git -b 10.0 --depth=1
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune

# sync floko-v3 branch of jasmine_sprout device tree

cd ~/floko/device/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_device_xiaomi_jasmine_sprout -b floko-v3
mv android_device_xiaomi_jasmine_sprout jasmine_sprout

# sync floko-v3 branch of wayne device tree

cd ~/floko/device/xiaomi/
git clone https://github.com/shoukolate/android_device_xiaomi_wayne -b floko-v3
mv android_device_xiaomi_wayne wayne

# sync floko-v3 branch of sdm660-common device tree

cd ~/floko/device/xiaomi/
git clone https://github.com/shoukolate/android_device_xiaomi_sdm660-common -b floko-v3
mv android_device_xiaomi_sdm660-common sdm660-common

# sync safetynet-bypass branch of kernel tree

cd ~/floko/kernel/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_kernel_xiaomi_sdm660 -b safetynet-bypass
mv android_kernel_xiaomi_sdm660 sdm660

# sync wayne vendor tree

cd ~/floko/vendor/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_vendor_xiaomi_wayne
mv android_vendor_xiaomi_wayne wayne

# sync sdm660-common vendor tree

cd ~/floko/vendor/
mkdir xiaomi
cd xiaomi
git clone https://github.com/shoukolate/android_vendor_xiaomi_sdm660-common
mv android_vendor_xiaomi_sdm660-common sdm660-common

cd ~/floko/
