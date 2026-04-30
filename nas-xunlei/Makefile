include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.7.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# 正确的架构判断（关键修复）
ifeq ($(CONFIG_TARGET_ARCH),x86_64)
  BIN_FILE:=x86_64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=1e3e636eea4c3104877c48f3cd75b578540fdf2a89210f1ebe05f1d6ac3ab45d
endif

ifeq ($(CONFIG_TARGET_ARCH),aarch64)
  BIN_FILE:=aarch64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=285c5b8156f775cf25531aa88e3e86d7df3883d692356fdd3eea58a0d566e39d
endif

# 防止未匹配架构（关键）
ifeq ($(BIN_FILE),)
$(error Unsupported architecture: $(CONFIG_TARGET_ARCH))
endif

PKG_SOURCE:=$(BIN_FILE)
PKG_SOURCE_URL:=https://github.com/sbwml/nas-xunlei-binary/releases/download/v$(PKG_VERSION)
PKG_HASH:=$(BIN_HASH)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=nas-xunlei
  DEPENDS:=@(x86_64||aarch64) +libc +libgcc +libstdcpp
endef

define Package/$(PKG_NAME)/description
 NAS Thunder download service
endef

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
	$(CP) $(PKG_BUILD_DIR)/* $(1)/usr/share/xunlei/

	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf /usr/share/xunlei/xunlei $(1)/usr/bin/xunlei
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
