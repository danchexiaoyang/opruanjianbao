# Copyright (C) 2020 Kongfl888
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-timedreboot
PKG_VERSION:=1.0
PKG_RELEASE:=4

LUCI_TITLE:=LuCI Application to timing reboot
LUCI_PKGARCH:=all
# 适配 25.12：+bash 可能较重，如果你确认脚本仅需 /bin/sh，可删除 +bash
LUCI_DEPENDS:=+luci +bash

include $(TOPDIR)/feeds/luci/luci.mk

# 移除了所有手动定义的 Package/$(PKG_NAME)/install
# luci.mk 会自动处理 ./luasrc, ./po, ./root 等标准目录结构

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
    chmod +x /etc/init.d/timedreboot
    chmod +x /usr/bin/dorboot
    # 强制清理缓存以触发重新索引
    rm -f /tmp/luci-indexcache
    rm -rf /tmp/luci-modulecache/*
fi
exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
sed -i '/dorboot/d' /etc/crontabs/root
rm -f /tmp/luci-indexcache
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
