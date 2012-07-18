# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/mupen64plus/mupen64plus-1.5-r2.ebuild,v 1.9 2012/05/22 00:04:03 jdhore Exp $

EAPI="2"

inherit eutils flag-o-matic games toolchain-funcs

PATCH_VERSION="20100507"

DESCRIPTION="A fork of Mupen64 Nintendo 64 emulator"
HOMEPAGE="http://code.google.com/p/mupen64plus/"
SRC_URI="http://mupen64plus.googlecode.com/files/mupen64plus-bundle-src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# GTK+ is currently required by plugins even if no GUI support is enabled
RDEPEND="virtual/opengl
	media-libs/freetype:2
	media-libs/libpng
	media-libs/libsdl
	media-libs/sdl-ttf
	media-fonts/dejavu
	sys-libs/zlib[minizip]
	x11-libs/gtk+:2
	media-libs/libsamplerate
	app-misc/lirc
	app-arch/xz-utils"

DEPEND="${RDEPEND}
	dev-lang/yasm
	virtual/pkgconfig"

S="${WORKDIR}/mupen64plus-bundle-src-${PV}"

src_compile() {
	pwd
	cd $S
	pwd
	./m64p_build.sh $MAKEOPTS || die
}

src_install() {
	./m64p_install.sh PREFIX=$D || die
}
