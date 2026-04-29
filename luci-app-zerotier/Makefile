# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-zerotier
PKG_VERSION:=1.0
PKG_RELEASE:=17

LUCI_TITLE:=LuCI support for ZeroTier
LUCI_PKGARCH:=all
# 适配 25.12：确保依赖名称正确，建议追加 +luci-compat 以便在 25.12 的界面中兼容
LUCI_DEPENDS:=+zerotier +luci-compat

include $(TOPDIR)/feeds/luci/luci.mk

# 明确定义配置文件的归属，这对 sysupgrade 备份配置至关重要
define Package/$(PKG_NAME)/conffiles
/etc/config/zerotier
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
