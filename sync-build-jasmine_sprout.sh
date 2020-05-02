#!/bin/bash

# Update rom source
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune

# Update device tree for jasmine_sprout

cd ~/floko/device/xiaomi/jasmine_sprout

git fetch origin
git reset --hard origin/floko-v3
git fetch && git pull

# Update common device tree for sdm660-common

cd ~/floko/device/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/floko-v3
git fetch && git pull

# Update sdm660 kernel

cd ~/floko/kernel/xiaomi/sdm660

git fetch origin
git reset --hard origin/safetynet-bypass
git fetch && git pull

# Update vendor tree for sdm660-common

cd ~/floko/vendor/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

# Update vendor tree for jasmine/wayne

cd ~/floko/vendor/xiaomi/wayne

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

cd ~/floko

# Build for jasmine_sprout

export PATH=~/bin:$PATH
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export LC_ALL=C
export FLOKO_BUILD_TYPE=OFFICIAL
ccache -M 100G

. build/envsetup.sh && brunch jasmine_sprout 2>&1 | tee ~/log/floko_$(date '+%Y%m%d_%H-%M-%S').log
