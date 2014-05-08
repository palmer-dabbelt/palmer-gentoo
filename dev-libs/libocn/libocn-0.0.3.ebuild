EAPI="5"

DESCRIPTION="An on-chip network library"
HOMEPAGE="http://github.com/palmer-dabbelt/libocn/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make
         media-gfx/graphviz"

DEPEND="${RDEPEND}"

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
	pconfigure
}

src_install() {
        make D=$D install
}
