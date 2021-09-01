#!/bin/bash
#
# Doraemon Kernel Script 2021
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

mkdir -p ~/.config/rclone
echo "$conf" > ~/.config/rclone/rclone.conf
cd /tmp/ci/halium
sudo apt install android-tools-mkbootimg bc build-essential ca-certificates cpio curl git kmod libssl-dev libtinfo5 python2 sudo unzip wget xz-utils -y --no-install-recommends
ln -sf python2.7 /usr/bin/python
wget https://raw.githubusercontent.com/LineageOS/android_system_core/lineage-17.1/mkbootimg/mkbootimg.py -O /usr/bin/mkbootimg
./build.sh
ls out
cd out
rclone copy device_on7xelte.tar.xz drive:Share/halium/on7xelte/
