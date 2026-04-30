include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.7.1
PKG_RELEASE:=1
STRIP:=false

PKG_MAINTAINER:=sbwml <admin@cooluc.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# 架构判断
ifeq ($(ARCH),aarch64)
  BIN_FILE:=aarch64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=285c5b8156f775cf25531aa88e3e86d7df3883d692356fdd3eea58a0d566e39d
endif

ifeq ($(ARCH),x86_64)
  BIN_FILE:=x86_64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=37948aac57bbc5ef56e62fbde3b23b4f121f9d94854b88efa0c1f575dbb08e55
endif

# 关键：使用标准 PKG_SOURCE 机制（不要 Download 宏）
PKG_SOURCE:=x86_64-v3.7.1-1.tar.xz
PKG_SOURCE_URL:=https://github.com/sbwml/nas-xunlei-binary/releases/download/v3.7.1-1
PKG_HASH:=37948aac57bbc5ef56e62fbde3b23b4f121f9d94854b88efa0c1f575dbb08e55

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=nas-xunlei
  DEPENDS:=@(aarch64||x86_64) +libc +libgcc +libstdcpp
  URL:=https://nas.xunlei.com/
endef

define Package/$(PKG_NAME)/description
  NAS Thunder download service
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
rm -rf /usr/share/xunlei
exit 0
endef

# 解压处理（关键）
define Build/Prepare
	$(call Build/Prepare/Default)
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components=1
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/xunlei

	# 通用写法（最安全）
	$(CP) $(PKG_BUILD_DIR)/* $(1)/usr/share/xunlei/

	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf /usr/share/xunlei/xunlei $(1)/usr/bin/xunlei
endef

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
