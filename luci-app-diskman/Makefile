include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-diskman
# 通常建议 LUCI_NAME 和 PKG_NAME 保持一致，luci.mk 会自动处理
PKG_VERSION:=0.2.13
PKG_RELEASE:=1
PKG_MAINTAINER:=lisaac <https://github.com/lisaac/luci-app-diskman>
PKG_LICENSE:=AGPL-3.0

# 这是一个 Lua 脚本应用，架构无关
LUCI_PKGARCH:=all

LUCI_TITLE:=Disk Manager interface for LuCI
LUCI_DESCRIPTION:=Disk Manager interface for LuCI

# 优化依赖格式，按功能分组，方便维护
LUCI_DEPENDS:= \
	+luci-compat \
	+luci-lib-ipkg \
	+e2fsprogs \
	+parted \
	+smartmontools \
	+blkid \
	+kmod-fs-vfat \
	+dosfstools \
	+kmod-fs-msdos \
	+kmod-nls-base \
	+kmod-nls-utf8 \
	+kmod-nls-cp932 \
	+kmod-nls-cp936 \
	+kmod-nls-cp950 \
	+kmod-fs-exfat \
	+exfat-mkfs \
	+exfat-fsck \
	+kmod-fs-ntfs \
	+kmod-fs-btrfs \
	+PACKAGE_$(PKG_NAME)_INCLUDE_ntfs_3g_utils:ntfs-3g-utils \
	+PACKAGE_$(PKG_NAME)_INCLUDE_btrfs_progs:btrfs-progs \
	+PACKAGE_$(PKG_NAME)_INCLUDE_lsblk:lsblk \
	+PACKAGE_$(PKG_NAME)_INCLUDE_mdadm:mdadm \
	+PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_raid456:mdadm \
	+PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_raid456:kmod-md-raid456 \
	+PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_linears:mdadm \
	+PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_linears:kmod-md-linear

# 配置选项保持不变
define Package/$(PKG_NAME)/config
config PACKAGE_$(PKG_NAME)_INCLUDE_ntfs_3g_utils
	depends on PACKAGE_$(PKG_NAME)
	bool "Include ntfs-3g-utils"
	default y

config PACKAGE_$(PKG_NAME)_INCLUDE_btrfs_progs
	depends on PACKAGE_$(PKG_NAME)
	bool "Include btrfs-progs"
	default y

config PACKAGE_$(PKG_NAME)_INCLUDE_lsblk
	depends on PACKAGE_$(PKG_NAME)
	bool "Include lsblk"
	default y

config PACKAGE_$(PKG_NAME)_INCLUDE_mdadm
	depends on PACKAGE_$(PKG_NAME)
	bool "Include mdadm"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_raid456
	depends on PACKAGE_$(PKG_NAME)_INCLUDE_mdadm
	bool "Include kmod-md-raid456"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_kmod_md_linears
	depends on PACKAGE_$(PKG_NAME)_INCLUDE_mdadm
	bool "Include kmod-md-linear"
	default n
endef

# 这一行必须放在最后，它会自动扫描 po 目录并生成 luci-i18n-diskman-zh-cn 包
include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
