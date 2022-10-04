#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-virtualhere
LUCI_PKGARCH:=all
PKG_VERSION:=2.0.2
PKG_RELEASE:=20210917

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
 	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=VirtualHere USB Service for LuCI
	DEPENDS:=@(mipsel)
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
    This package contains LuCI configuration pages for VirtualHere USB Service.
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
	chmod +x $(1)/etc/init.d/vhusbd
	$(INSTALL_DIR) $(1)/usr/bin
	cp -pR ./bin/vhusbdmipsel $(1)/usr/bin/
	tar -zxvf ./bin/vhusbdmipsel $(1)/usr/bin/
	chmod +x  $(1)/usr/bin/vhusbd
endef


$(eval $(call BuildPackage,$(PKG_NAME)))

# call BuildPackage - OpenWrt buildroot signature
