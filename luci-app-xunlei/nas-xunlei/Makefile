
include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.7.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# 获取目标架构
TARGET_ARCH:=$(if $(CONFIG_ARCH),$(CONFIG_ARCH),$(CONFIG_TARGET_ARCH))

# 根据目标架构选择二进制包
ifeq ($(TARGET_ARCH),x86_64)
  BIN_FILE:=x86_64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=1e3e636eea4c3104877c48f3cd75b578540fdf2a89210f1ebe05f1d6ac3ab45d
else ifeq ($(TARGET_ARCH),aarch64)
  BIN_FILE:=aarch64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=285c5b8156f775cf25531aa88e3e86d7df3883d692356fdd3eea58a0d566e39d
else
  # Feed dump 阶段可能没有加载目标架构
  ifneq ($(strip $(TARGET_ARCH)),)
    $(error Unsupported architecture: $(TARGET_ARCH))
  endif
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
