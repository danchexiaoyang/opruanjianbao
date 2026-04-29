include $(TOPDIR)/rules.mk

PKG_NAME:=libc6-compat
PKG_VERSION:=2.34
PKG_RELEASE:=1

# 25.12 使用 Build/Default 即可，无需显式定义 PKG_BUILD_DIR
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Compatibility libraries for glibc
  # 25.12 中 musl 已经是核心，直接通过 DEPENDS 声明
  DEPENDS:=@USE_MUSL
  # 移除了过时的 aarch64/x86_64 硬编码依赖，适配更多架构
endef

define Package/$(PKG_NAME)/description
  Compatibility libraries for glibc to run binaries on musl-based OpenWrt.
endef

# 25.12 标准安装路径应符合 FHS (Filesystem Hierarchy Standard)
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libc6.so $(1)/lib/libc.so.6
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
