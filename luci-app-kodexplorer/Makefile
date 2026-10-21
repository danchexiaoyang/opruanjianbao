include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for KodExplorer
LUCI_PKGARCH:=all

# 核心依赖：Nginx + PHP8 运行时 + 必要的 PHP 扩展
LUCI_DEPENDS:= \
	+nginx-ssl \
	+php8 \
	+php8-fastcgi \
	+php8-mod-curl \
	+php8-mod-dom \
	+php8-mod-fileinfo \
	+php8-mod-gd \
	+php8-mod-iconv \
	+php8-mod-mbstring \
	+php8-mod-opcache \
	+php8-mod-openssl \
	+php8-mod-pdo \
	+php8-mod-pdo-sqlite \
	+php8-mod-session \
	+php8-mod-xml \
	+php8-mod-zip

PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
$(eval $(call BuildPackage,luci-app-kodexplorer))
