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
         dev-lang/scala"

DEPEND="${RDEPEND}
        sci-electronics/chisel"

src_configure() {
        cat >Configfile <<EOF
PREFIX = ${EPREFIX}/usr

LANGUAGES += scala
LANGUAGES += pkgconfig
LANGUAGES += h
LANGUAGES += bash

LIBRARIES += librocket-uncore.jar
COMPILEOPTS += `ppkg-config chisel --libs`
SOURCES += main/scala/uncore.scala

LIBRARIES += pkgconfig/rocket-uncore.pc
SOURCES += rocket-uncore.pc
EOF

        cat > src/rocket-uncore.pc <<EOF
prefix=@@pconfigure_prefix@@
exec_prefix=@@pconfigure_prefix@@
libdir=\${prefix}/@@pconfigure_libdir@@
includedir=\${prefix}/@@pconfigure_hdrdir@@

Name: rocket-uncore
Description: The uncore for Rocket
Version: $PV
Libs: -lrocket-uncore
URL: http://github.com/ucb-bar/uncore
EOF

	pconfigure
}
