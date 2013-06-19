# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/nm-applet/nm-applet-0.9.6.4-r1.ebuild,v 1.1 2013/06/10 10:08:14 sping Exp $

EAPI="4"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"
GNOME_ORG_MODULE="network-manager-applet"

inherit eutils gnome2

DESCRIPTION="GNOME applet for NetworkManager"
HOMEPAGE="http://projects.gnome.org/NetworkManager/"
SRC_URI="${SRC_URI}
	http://dev.gentoo.org/~ssuominen/pngcrush-fixed-nm-signal-icons.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
IUSE="bluetooth gconf gtk2 gtk3"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND=">=dev-libs/glib-2.26:2
	>=dev-libs/dbus-glib-0.88
	>=gnome-base/gnome-keyring-2.20
	>=sys-apps/dbus-1.4.1
	>=sys-auth/polkit-0.96-r1
	gtk3? ( >=x11-libs/gtk+-3:3 )
	gtk2? ( >=x11-libs/gtk+-2.20:2 )
	>=x11-libs/libnotify-0.7.0

	app-text/iso-codes
	>=net-misc/networkmanager-0.9.6
	net-misc/mobile-broadband-provider-info

	bluetooth? ( >=net-wireless/gnome-bluetooth-2.27.6 )
	gconf? ( >=gnome-base/gconf-2.20:2 )
	virtual/freedesktop-icon-theme"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=dev-util/intltool-0.40"

src_prepare() {
	if use gtk2
	then
		GTKVER="2"
	elif use gtk3
	then
		GTKVER="3"
	else
		die "Use either gtk2 or gtk3"
	fi

	DOCS="AUTHORS ChangeLog NEWS README"
	G2CONF="${G2CONF}
		--with-gtkver=$GTKVER
		--disable-more-warnings
		--disable-static
		--localstatedir=/var
		$(use_with bluetooth)
		$(use_enable gconf migration)"

	mv -f "${WORKDIR}"/nm-signal-*.png icons/22/

	gnome2_src_prepare

	epatch "${FILESDIR}"/${PN}-0.9.6.4-systray-icon-size.patch
}
