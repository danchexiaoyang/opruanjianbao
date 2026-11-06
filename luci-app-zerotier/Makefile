# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-zerotier
PKG_VERSION:=1.0
PKG_RELEASE:=17

LUCI_TITLE:=LuCI support for ZeroTier
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+zerotier +luci-compat

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/conffiles
/etc/config/zerotier
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
