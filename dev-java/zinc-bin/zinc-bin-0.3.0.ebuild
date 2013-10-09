# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Another interface to sbt's incremental compiler"
HOMEPAGE="https://github.com/typesafehub/${PN}"
SRC_URI="http://repo.typesafe.com/typesafe/zinc/com/typesafe/zinc/dist/${PV}/zinc-${PV}.tgz -> ${P}.tar.gz"
S="${WORKDIR}/zinc-${PV}"

SLOT="0"
KEYWORDS="~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
        :
}

src_install() {
        mkdir -p ${ED}/usr/bin
        cp bin/zinc ${ED}/usr/bin
}
