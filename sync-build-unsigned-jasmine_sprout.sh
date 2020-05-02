#!/bin/bash

# Update rom source
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune

# Update device tree for jasmine_sprout

cd ~/los/device/xiaomi/jasmine_sprout

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

# Update common device tree for sdm660-common

cd ~/los/device/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

# Update sdm660 kernel

cd ~/los/kernel/xiaomi/sdm660

git fetch origin
git reset --hard origin/safetynet-bypass
git fetch && git pull

# Update vendor tree for sdm660-common

cd ~/los/vendor/xiaomi/sdm660-common

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

# Update vendor tree for jasmine/wayne

cd ~/los/vendor/xiaomi/wayne

git fetch origin
git reset --hard origin/lineageos-17.1
git fetch && git pull

cd ~/los

# Build for jasmine_sprout

export PATH=~/bin:$PATH
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export LC_ALL=C
ccache -M 100G

source build/envsetup.sh
breakfast jasmine_sprout
croot
brunch jasmine_sprout
