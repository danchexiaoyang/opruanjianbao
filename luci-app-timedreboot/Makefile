# Copyright (C) 2020 Kongfl888
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-timedreboot
PKG_VERSION:=1.0
PKG_RELEASE:=4

LUCI_TITLE:=LuCI Application to timing reboot
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+bash

include $(TOPDIR)/feeds/luci/luci.mk

# postrm 保留：apk 现已支持 post-deinstall 脚本
define Package/$(PKG_NAME)/postrm
#!/bin/sh
sed -i '/dorboot/d' /etc/crontabs/root
rm -f /tmp/luci-indexcache
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
