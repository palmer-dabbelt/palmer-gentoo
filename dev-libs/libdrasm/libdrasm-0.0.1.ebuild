EAPI="5"

DESCRIPTION="A Flo file format parser"
HOMEPAGE="http://github.com/palmer-dabbelt/tek/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make
         dev-libs/libflo
         dev-libs/libocn"

DEPEND="${RDEPEND}"

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
	pconfigure
}

src_install() {
        make D=$D install
}
