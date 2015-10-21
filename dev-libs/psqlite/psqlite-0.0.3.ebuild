EAPI="5"
inherit eutils

DESCRIPTION="Git's date parsing code"
HOMEPAGE="http://www.dabbelt.com/~palmer/software/${PN}/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         dev-db/sqlite
         "

DEPEND="${RDEPEND}"

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
        pconfigure
}
