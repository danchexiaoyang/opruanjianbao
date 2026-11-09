include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=1.0.1
PKG_RELEASE:=2

LUCI_TITLE:=LuCI support for NAS-Xunlei
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+nas-xunlei
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

define Package/$(PKG_NAME)/conffiles
/etc/xunlei
/etc/synoinfo.conf
endef

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

define Package/luci-app-xunlei/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/xunlei $(1)/etc/init.d/xunlei

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./root/etc/uci-defaults/luci-xunlei $(1)/etc/uci-defaults/luci-xunlei
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
