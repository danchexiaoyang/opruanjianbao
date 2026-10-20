include $(TOPDIR)/rules.mk

PKG_NAME:=libc6-compat
PKG_VERSION:=2.34
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Compatibility libraries for glibc (placeholder)
  DEPENDS:=@USE_MUSL
endef

define Package/$(PKG_NAME)/description
  Placeholder for a glibc compatibility layer on musl-based OpenWrt.
  NOTE: Symlinking musl libraries to glibc paths is NOT a reliable
  compatibility solution. Use gcompat or a full glibc runtime instead.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
	:
endef

# 保留安装步骤作为占位，但强烈建议替换为真正的兼容层文件。
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib
	# 警告：以下符号链接不可靠，仅作占位示例。
	# ln -sf /lib/ld-musl-x86_64.so.1 $(1)/lib/ld-linux-x86-64.so.2
	# ln -sf /lib/libc.so $(1)/lib/libc.so.6
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
