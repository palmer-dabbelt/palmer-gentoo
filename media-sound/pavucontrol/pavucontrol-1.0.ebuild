# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/pavucontrol/pavucontrol-1.0.ebuild,v 1.7 2012/05/20 20:48:51 ssuominen Exp $

EAPI=4

DESCRIPTION="Pulseaudio Volume Control, GTK based mixer for Pulseaudio"
HOMEPAGE="http://freedesktop.org/software/pulseaudio/pavucontrol/"
SRC_URI="http://freedesktop.org/software/pulseaudio/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd"
IUSE="nls gtk2 gtk3"

RDEPEND=">=dev-cpp/gtkmm-3.0:3.0
	>=dev-libs/libsigc++-2.2:2
	gtk3? ( >=media-libs/libcanberra-0.16[gtk3] )
	gtk2? ( >=media-libs/libcanberra-0.16[gtk] )
	>=media-sound/pulseaudio-0.9.16[glib]
	virtual/freedesktop-icon-theme"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? (
		dev-util/intltool
		sys-devel/gettext
		)"

DOCS="ChangeLog"

src_configure() {
        GTKCONF=""
	if use gtk2; then
	        GTKCONF="--disable-gtk3"
	fi

	econf \
		--docdir=/usr/share/doc/${PF} \
		--htmldir=/usr/share/doc/${PF}/html \
		--disable-lynx \
		$(use_enable nls) \
		$GTKCONF
}
