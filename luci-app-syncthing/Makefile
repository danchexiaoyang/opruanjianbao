# Copyright (C) 2020 Gyj1109
# 适配 OpenWrt 25.12 修改版

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-syncthing
PKG_VERSION:=1.0
PKG_RELEASE:=3

LUCI_TITLE:=LuCI support for Syncthing
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+syncthing

include $(TOPDIR)/feeds/luci/luci.mk

# 明确定义配置文件的归属（apk 仍会通过 conffiles_static 机制处理）
define Package/$(PKG_NAME)/conffiles
/etc/config/syncthing
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
