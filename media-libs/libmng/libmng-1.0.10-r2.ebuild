# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libmng/Attic/libmng-1.0.10-r2.ebuild,v 1.3 2014/08/28 15:44:11 ssuominen dead $

EAPI=5
inherit autotools-multilib

DESCRIPTION="Multiple Image Networkgraphics lib (animated png's)"
HOMEPAGE="http://www.libmng.com/"
SRC_URI="mirror://sourceforge/libmng/${P}.tar.gz"

LICENSE="libmng"
SLOT="1"
KEYWORDS="amd64"
IUSE="lcms static-libs"

# should be [${MULTILIB_USEDEP}] in the end of lcms dep, need to convert it
RDEPEND=">=virtual/jpeg-0-r2:0[${MULTILIB_USEDEP}]
	>=sys-libs/zlib-1.2.8-r1[${MULTILIB_USEDEP}]
	lcms? ( media-libs/lcms:0 )
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-baselibs-20130224-r5
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}"

src_prepare() {
	ln -s makefiles/configure.in .
	ln -s makefiles/Makefile.am .
	sed -i '/^AM_C_PROTOTYPES$/d' configure.in || die #420223

	eautoreconf
	autotools-multilib_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable static-libs static)
		--with-jpeg
		$(use_with lcms)
		)

	autotools-multilib_src_configure
}

src_install() {
	autotools-multilib_src_install

	dodoc CHANGES README* doc/{doc.readme,libmng.txt}
	doman doc/man/*
}
