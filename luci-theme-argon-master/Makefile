# Copyright (C) 2008-2019 Jerrykuku
# 适配 OpenWrt 25.12 修改版

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-theme-argon
PKG_VERSION:=2.4.3
PKG_RELEASE:=20250722

LUCI_TITLE:=Argon Theme
LUCI_DEPENDS:=+wget +jsonfilter
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# 适配 25.12：确保主题包被正确归类
# 通过定义 PKG_NAME 确保在 apk 管理器中路径准确

$(eval $(call BuildPackage,luci-theme-argon))
