# Copyright (C) 2016 Openwrt.org
# Copyright (C) 2020-2021 sirpdboy <herboy2008@gmail.com>
# Copyright (C) 2025 Your Name <your.email@example.com>

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-netdata
PKG_VERSION:=1.1
PKG_RELEASE:=4

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

LUCI_TITLE:=LuCI support for Netdata
LUCI_DEPENDS:=+netdata
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
$(eval $(call BuildPackage,luci-app-netdata))
