include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-onliner
PKG_VERSION:=1.0
PKG_RELEASE:=r1

LUCI_TITLE:=LuCI support for arp-onliner
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+arp-scan

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,luci-app-onliner))
