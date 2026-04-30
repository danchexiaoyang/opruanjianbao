include $(TOPDIR)/rules.mk

PKG_NAME:=libc6-compat
PKG_VERSION:=2.34
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Compatibility libraries for glibc
  DEPENDS:=@USE_MUSL
endef

define Package/$(PKG_NAME)/description
  Compatibility libraries for glibc to run binaries on musl-based OpenWrt.
  This package creates symlinks from glibc paths to musl paths.
endef

# 关键修复 1：定义空的准备步骤，防止系统去下载或解压不存在的源码
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

# 关键修复 2：定义空的编译步骤，防止系统在空目录下运行 make 导致报错
define Build/Compile
	:
endef

# 关键修复 3：修正安装逻辑。
# 迅雷等 x86_64 程序查找的是 ld-linux-x86-64.so.2 和 libc.so.6
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib
	# 链接核心库：将 glibc 的名字链接到系统自带的 musl 库上
	ln -sf /lib/ld-musl-x86_64.so.1 $(1)/lib/ld-linux-x86-64.so.2
	ln -sf /lib/libc.so $(1)/lib/libc.so.6
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
