EAPI="4"
inherit eutils

DESCRIPTION="Git's date parsing code"
HOMEPAGE="http://www.dabbelt.com/~palmer/software/${PN}/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE="scala"

RDEPEND="sys-devel/pconfigure
         "

DEPEND="${RDEPEND}"

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
        pconfigure
}