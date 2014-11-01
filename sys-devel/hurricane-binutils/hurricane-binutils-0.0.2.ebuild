EAPI="5"

DESCRIPTION="Like GNU Binutils, but for Hurricane"
HOMEPAGE="http://github.com/palmer-dabbelt/${PN}"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make"

DEPEND="${RDEPEND}"

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
	pconfigure
}

src_install() {
        make D=$D install
}
