#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 将 H3C Magic NX30 Pro 的 ubi 分区大小从 112MB (0x7000000) 改回 64MB (0x4000000)
DTS_FILE=$(find target/linux/mediatek/ -name "mt7981b-h3c-magic-nx30-pro.dts" | head -n 1)
if [ -n "$DTS_FILE" ]; then
  echo "Found DTS: $DTS_FILE"
  sed -i 's/0x7000000/0x4000000/g' "$DTS_FILE"
  grep -n "0x4000000" "$DTS_FILE" || true
else
  echo "Warning: DTS file not found!"
fi
