include $(TOPDIR)/rules.mk

PKG_NAME:=nghttp3
PKG_VERSION:=1.5.0-DEV
PKG_RELEASE:=caf3de4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ngtcp2/nghttp3.git
PKG_SOURCE_VERSION:=caf3de4eab6ebc35fcb75abdc24895ba55742bfa
PKG_MIRROR_HASH:=

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libnghttp3
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=HTTP/3 library written in C
  URL:=https://nghttp2.org/nghttp3
endef

define Package/libnghttp3/description
nghttp3 is a thin HTTP/3 layer over an underlying QUIC stack.
endef

CONFIGURE_ARGS += --enable-lib-only

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/nghttp3
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/nghttp3/*.h $(1)/usr/include/nghttp3/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libnghttp3.so* $(1)/usr/lib/
endef

define Package/libnghttp3/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libnghttp3.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libnghttp3))
