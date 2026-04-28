# 版权所有 (C) 2018-2020 Lienol <lawlienol@gmail.com>
# 适配 OpenWrt 25.12 修改版

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for KodExplorer
# 移除了不存在的 mcrypt，并精简了 PHP 核心模块
LUCI_DEPENDS:=+nginx +unzip +zoneinfo-asia +php8 +php8-cgi +php8-fpm \
	+php8-mod-curl +php8-mod-dom +php8-mod-exif +php8-mod-fileinfo \
	+php8-mod-gd +php8-mod-iconv +php8-mod-intl +php8-mod-mbstring \
	+php8-mod-mysqli +php8-mod-opcache +php8-mod-openssl +php8-mod-session \
	+php8-mod-xml +php8-mod-zip +php8-pecl-redis
LUCI_PKGARCH:=all

PKG_VERSION:=1
PKG_DATE:=20260428

# 只需要 include 这个，它会自动处理 define Package 逻辑
include $(TOPDIR)/feeds/luci/luci.mk

# 移除原来手写的 define Package/luci-app-kodexplorer 整个区块
# 移除 Build/Prepare 和 Build/Compile 默认块（luci.mk 会处理）

$(eval $(call BuildPackage,luci-app-kodexplorer))
