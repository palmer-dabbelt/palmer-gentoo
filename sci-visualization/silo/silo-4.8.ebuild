EAPI="4"

DESCRIPTION="A mesh and field I/O library and scientific database"
HOMEPAGE="https://wci.llnl.gov/codes/silo/index.html"
SRC_URI="https://wci.llnl.gov/codes/silo/silo-${PV}/silo-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""

DEPEND="${RDEPEND}"

src_configure() {
		./configure --enable-shared=silo --prefix=/usr
}

src_install() {
	      make DESTDIR="${D}" install
}
