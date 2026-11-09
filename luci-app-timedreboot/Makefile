
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-timedreboot
PKG_VERSION:=1.0
PKG_RELEASE:=4

LUCI_TITLE:=LuCI Application to timing reboot
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+bash

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
    sed -i '/dorboot/d' /etc/crontabs/root
    rm -f /tmp/luci-indexcache
fi
exit 0
endef

define Package/luci-app-timedreboot/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/timedreboot $(1)/etc/init.d/timedreboot
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
