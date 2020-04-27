#!/bin/bash

# update rom source
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune

# update common device tree for sdm660-common

cd ~/floko/device/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/floko-v3
git fetch && git pull

# update device tree for wayne

cd ~/floko/device/xiaomi/wayne

git fetch origin
git reset --hard origin/floko-v3
git fetch && git pull

# update sdm660 kernel

cd ~/floko/kernel/xiaomi/sdm660

git fetch origin
git reset --hard origin/kernel.lnx.4.4.r38-rel-wifi-safetynet-bypass
git fetch && git pull

# update vendor tree for sdm660-common

cd ~/floko/vendor/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

# update vendor tree for jasmine/wayne

cd ~/floko/vendor/xiaomi/wayne

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

cd ~/floko

# build for wayne

export PATH=~/bin:$PATH
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export LC_ALL=C
export FLOKO_BUILD_TYPE=OFFICIAL
ccache -M 100G

. build/envsetup.sh && brunch wayne 2>&1 | tee ~/log/floko_$(date '+%Y%m%d_%H-%M-%S').log
