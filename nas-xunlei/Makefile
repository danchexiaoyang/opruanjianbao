
include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.7.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# 获取目标架构
TARGET_ARCH_RAW:=$(if $(CONFIG_TARGET_ARCH_PACKAGES),$(CONFIG_TARGET_ARCH_PACKAGES),$(ARCH))

# 清理架构变量中的双引号和空格
TARGET_ARCH:=$(subst ",,$(strip $(TARGET_ARCH_RAW)))

# 根据目标架构选择对应的二进制包
ifneq ($(filter x86_64,$(TARGET_ARCH)),)
  BIN_FILE:=x86_64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=1e3e636eea4c3104877c48f3cd75b578540fdf2a89210f1ebe05f1d6ac3ab45d

else ifneq ($(filter aarch64 aarch64_generic aarch64_cortex-a53 aarch64_cortex-a72,$(TARGET_ARCH)),)
  BIN_FILE:=aarch64-v$(PKG_VERSION).tar.xz
  BIN_HASH:=285c5b8156f775cf25531aa88e3e86d7df3883d692356fdd3eea58a0d566e39d

else
  # Feed 扫描阶段可能没有架构变量
  ifeq ($(TARGET_ARCH),)
    BIN_FILE:=x86_64-v$(PKG_VERSION).tar.xz
    BIN_HASH:=1e3e636eea4c3104877c48f3cd75b578540fdf2a89210f1ebe05f1d6ac3ab45d
  else
    $(warning nas-xunlei: TARGET_ARCH_RAW=$(TARGET_ARCH_RAW))
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
