# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/pavucontrol/pavucontrol-1.0.ebuild,v 1.8 2013/04/05 17:18:39 ago Exp $

EAPI=4

DESCRIPTION="Pulseaudio Volume Control, GTK based mixer for Pulseaudio"
HOMEPAGE="http://freedesktop.org/software/pulseaudio/pavucontrol/"
SRC_URI="http://freedesktop.org/software/pulseaudio/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~ppc64 ~sparc x86 ~x86-fbsd"
IUSE="nls gtk3"

RDEPEND=">=dev-libs/libsigc++-2.2:2
	>=media-sound/pulseaudio-0.9.16[glib]
	virtual/freedesktop-icon-theme

        gtk3? ( >=dev-cpp/gtkmm-3.0:3.0 )
        !gtk3? ( dev-cpp/gtkmm:2.4 )

	gtk3? ( >=media-libs/libcanberra-0.16[gtk3] )
	!gtk3? ( >=media-libs/libcanberra-0.16[gtk] )
        "
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? (
		dev-util/intltool
		sys-devel/gettext
		)"

DOCS="ChangeLog"

src_configure() {
	econf \
		--docdir=/usr/share/doc/${PF} \
		--htmldir=/usr/share/doc/${PF}/html \
		--disable-lynx \
		$(use_enable nls) \
                $(use_enable gtk3)
}
