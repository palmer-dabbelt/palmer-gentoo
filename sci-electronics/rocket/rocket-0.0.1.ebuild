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
        sci-electronics/chisel:=
        sci-electronics/rocket-uncore:=
        sci-electronics/berkeley-hardfloat:="

src_configure() {
        cat >Configfile <<EOF
PREFIX = ${EPREFIX}/usr

LANGUAGES += scala
LANGUAGES += pkgconfig
LANGUAGES += h
LANGUAGES += bash

LIBRARIES += librocket.jar
COMPILEOPTS += `ppkg-config rocket-uncore --libs`
COMPILEOPTS += `ppkg-config berkeley-hardfloat --libs`
COMPILEOPTS += `ppkg-config chisel --libs`
SOURCES += main/scala/core.scala

LIBRARIES += pkgconfig/rocket.pc
SOURCES += rocket.pc
EOF

        cat > src/rocket.pc <<EOF
prefix=@@pconfigure_prefix@@
exec_prefix=@@pconfigure_prefix@@
libdir=\${prefix}/@@pconfigure_libdir@@
includedir=\${prefix}/@@pconfigure_hdrdir@@

Name: rocket
Description: An in order RISC-V core
Version: $PV
Requires: chisel
Libs: -lrocket
URL: http://github.com/ucb-bar/rocket
EOF

	pconfigure
}
