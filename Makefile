include $(TOPDIR)/rules.mk

PKG_NAME:=nghttp3
PKG_VERSION:=1.6.0-dev
PKG_RELEASE:=7473d2f

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ngtcp2/nghttp3.git
PKG_SOURCE_VERSION:=7473d2f0aa6a2edd15be3e06fcecdac576a9fab0
PKG_MIRROR_HASH:=skip

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
