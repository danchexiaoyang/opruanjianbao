# Copyright (C) 2016 Openwrt.org
include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=thunder-$(PKG_VERSION)-x86_64-unknown-linux-musl.tar.gz
PKG_FILE:=$(PKG_SOURCE)
PKG_SOURCE_URL:=https://github.com/0x676e67/thunder/releases/download/v$(PKG_VERSION)
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=NAS Thunder download service
	DEPENDS:=@(x86_64||aarch64) +libc +libgcc +libstdcpp
endef

define Package/$(PKG_NAME)/description
	NAS Thunder download service, extracted from Synology package.
	Supports x86_64 and aarch64 architectures.
endef

define Build/Compile
	# 二进制包，无需编译
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/xunlei
	
	# 排除 ipkg-* 临时目录，安全地将解压后的所有必要文件复制到安装目录
	find $(PKG_BUILD_DIR) -maxdepth 1 -not -name 'ipkg-*' -not -name '.' -exec cp -fpR {} $(1)/usr/share/xunlei/ \;

	$(INSTALL_DIR) $(1)/usr/bin
	# 确保这里软链接的目标文件名与压缩包内的可执行主程序名称一致
	ln -sf /usr/share/xunlei/thunder $(1)/usr/bin/xunlei
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
