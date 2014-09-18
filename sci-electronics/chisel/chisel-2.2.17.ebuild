EAPI="5"

inherit eutils

DESCRIPTION="A HDL"
HOMEPAGE="http://github.com/ucb-bar/${PN}/"
SRC_URI="https://github.com/ucb-bar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="dev-java/sbt-bin
         dev-lang/scala"

DEPEND="${RDEPEND}"

src_configure() {
        cat >Configfile <<EOF
PREFIX = ${EPREFIX}/usr

LANGUAGES += scala
LANGUAGES += pkgconfig

LIBRARIES += chisel.jar
SOURCES += main/scala/Driver.scala

LIBRARIES += pkgconfig/chisel.pc
SOURCES += chisel.pc
EOF

        cat > src/chisel.pc <<EOF
prefix=@@pconfigure_prefix@@
exec_prefix=@@pconfigure_prefix@@
libdir=\${prefix}/@@pconfigure_libdir@@
includedir=\${prefix}/@@pconfigure_hdrdir@@

Name: chisel
Description: A HDL
Version: $PV
Libs: -lchisel
URL: http://github.com/ucb-bar/chisel
EOF

	pconfigure
}
