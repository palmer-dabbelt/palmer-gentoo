# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils pam toolchain-funcs

DESCRIPTION="Example PAM module demonstrating two-factor authentication"
HOMEPAGE="http://code.google.com/p/google-authenticator/"
SRC_URI="http://google-authenticator.googlecode.com/files/libpam-google-authenticator-1.0-source.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}
	media-gfx/qrencode"

src_install() {
	dopammod pam_google_authenticator.so

	dobin google-authenticator

	dodoc README
	dohtml totp.html
}
