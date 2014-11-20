EAPI="5"

inherit eutils

DESCRIPTION="A HDL"
HOMEPAGE="http://github.com/palmer-dabbelt/${PN}/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="dev-java/sbt-bin
         dev-lang/scala
        sci-electronics/chisel:="

DEPEND="${RDEPEND}"

src_configure() {
        cat >Configfile <<EOF
PREFIX = ${EPREFIX}/usr

LANGUAGES += scala
LANGUAGES += pkgconfig
LANGUAGES += h
LANGUAGES += bash

LIBRARIES += lib${PN}.jar
COMPILEOPTS += `ppkg-config chisel --libs`
SOURCES += main/scala/consts.scala

LIBRARIES += pkgconfig/${PN}.pc
SOURCES += ${PN}.pc
EOF

        cat > src/${PN}.pc <<EOF
prefix=@@pconfigure_prefix@@
exec_prefix=@@pconfigure_prefix@@
libdir=\${prefix}/@@pconfigure_libdir@@
includedir=\${prefix}/@@pconfigure_hdrdir@@

Name: ${PN}
Description: UC Berkeley's hardware floating point library
Version: $PV
Libs: -l${PN}
Requires: chisel
URL: http://github.com/ucb-bar/${PN}
EOF

	pconfigure
}
