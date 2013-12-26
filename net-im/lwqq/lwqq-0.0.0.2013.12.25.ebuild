# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils

DESCRIPTION="A Linux WebQQ Client"
HOMEPAGE="https://github.com/xiehuc/lwqq"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	sys-devel/cmake"
