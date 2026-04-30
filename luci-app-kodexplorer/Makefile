include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for KodExplorer

# 精简 + 修正依赖（关键）
LUCI_DEPENDS:= \
	+nginx \
	+unzip \
	+zoneinfo-asia \
	+php8 \
	+php8-cgi \
	+php8-fpm \
	+php8-mod-curl \
	+php8-mod-dom \
	+php8-mod-fileinfo \
	+php8-mod-gd \
	+php8-mod-iconv \
	+php8-mod-intl \
	+php8-mod-mbstring \
	+php8-mod-opcache \
	+php8-mod-openssl \
	+php8-mod-pdo \
	+php8-mod-pdo-sqlite \
	+php8-mod-session \
	+php8-mod-xml \
	+php8-mod-zip

LUCI_PKGARCH:=all
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-kodexplorer
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=Applications
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
  PKGARCH:=$(LUCI_PKGARCH)
endef

define Package/luci-app-kodexplorer/description
 LuCI support for KodExplorer, a web-based file manager for OpenWrt.
endef

# LuCI 纯脚本包，这两个可以省略
# define Build/Prepare
# endef
#
# define Build/Compile
# endef

$(eval $(call BuildPackage,luci-app-kodexplorer))
