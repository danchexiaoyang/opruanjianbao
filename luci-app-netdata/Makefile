# Copyright (C) 2016 Openwrt.org
# Copyright (C) 2020-2021 sirpdboy <herboy2008@gmail.com>

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-netdata
PKG_VERSION:=1.1
PKG_RELEASE:=3

LUCI_TITLE:=LuCI support for Netdata
# 适配 25.12：确保依赖项在当前的 feeds 中存在
# 如果编译报错找不到 netdata，请将其修改为 netdata-web 或 netdata-apps
LUCI_DEPENDS:=+netdata
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# 移除空的 Build/Compile，由 luci.mk 自动处理
$(eval $(call BuildPackage,luci-app-netdata))
