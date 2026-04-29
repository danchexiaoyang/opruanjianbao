# Copyright (C) 2016 Openwrt.org
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=1.0.1
PKG_RELEASE:=2

LUCI_TITLE:=LuCI support for NAS-Xunlei
LUCI_PKGARCH:=all
# 适配 25.12：确保依赖名称与之前定义的 nas-xunlei 一致
LUCI_DEPENDS:=+nas-xunlei
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/conffiles
/etc/xunlei
/etc/synoinfo.conf
endef

# 25.12 中，postinst/postrm 脚本应尽可能精简，
# 因为 apk 拥有更强的自动触发机制。
define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
    if [ -f /etc/uci-defaults/luci-xunlei ]; then
        /etc/uci-defaults/luci-xunlei && rm -f /etc/uci-defaults/luci-xunlei
    fi
fi
exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
rm -rf /var/packages/pan-xunlei-com
exit 0
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xunlei $(1)/etc/init.d/xunlei
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
