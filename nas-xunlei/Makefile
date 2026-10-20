include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.7.1
PKG_RELEASE:=1

# 必须替换为经过验证的有效 URL 和对应的 SHA256
# 以下 URL 仅为示例结构，需根据实际情况确认
PKG_SOURCE:=x86_64-v$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://github.com/gngpp/nas-xunlei/releases/download/v$(PKG_VERSION)
PKG_HASH:=skip  # 首次编译时使用 skip，成功后在 dl/ 目录下用 sha256sum 计算并固定

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

# 移除自定义 Build/Prepare，让默认流程处理下载和解压
# 如果 tarball 结构特殊，再考虑添加 --strip-components

define Build/Compile
	# 二进制包，无需编译
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/xunlei
	$(CP) $(PKG_BUILD_DIR)/* $(1)/usr/share/xunlei/

	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf /usr/share/xunlei/xunlei $(1)/usr/bin/xunlei

	# 可选：安装 init 脚本（如果 tarball 中未提供，需自行创建）
	# $(INSTALL_DIR) $(1)/etc/init.d
	# $(INSTALL_BIN) ./files/xunlei.init $(1)/etc/init.d/xunlei
endef

# 可选：在安装后启用服务
# define Package/$(PKG_NAME)/postinst
# #!/bin/sh
# [ -n "$${IPKG_INSTROOT}" ] || {
#     /etc/init.d/xunlei enable
#     /etc/init.d/xunlei start
# }
# exit 0
# endef

$(eval $(call BuildPackage,$(PKG_NAME)))
