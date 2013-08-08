# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/glfw/glfw-2.6.ebuild,v 1.8 2012/11/14 23:31:43 hasufell Exp $

EAPI=2
inherit eutils multilib toolchain-funcs cmake-utils

DESCRIPTION="The Portable OpenGL FrameWork"
HOMEPAGE="http://glfw.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="ZLIB"
SLOT="3"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="x11-libs/libXrandr
	virtual/glu
	virtual/opengl"

mycmakeargs="-DBUILD_SHARED_LIBS=1"

src_prepare() {
              epatch "${FILESDIR}"/${P}-slot.patch
}
