# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/livestreamer/livestreamer-1.10.2.ebuild,v 1.1 2014/11/15 12:40:38 hwoarang Exp $

EAPI="5"

DESCRIPTION="CLI tool to upload youtube videos"
HOMEPAGE="https://code.google.com/p/youtube-upload/"
SRC_URI="https://github.com/palmer-dabbelt/youtube-upload/archive/v${PV}.tar.gz -> ${P}.tar.gz"

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

KEYWORDS="~amd64"
LICENSE="GPLv3"
SLOT="0"

RDEPEND="dev-python/gdata[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
