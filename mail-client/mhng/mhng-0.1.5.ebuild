EAPI="5"
inherit eutils

DESCRIPTION="A modern MH clone"
HOMEPAGE="http://www.dabbelt.com/~palmer/software/mhng/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="app-crypt/gpgme
         dev-libs/gitdate:=
         >=dev-libs/psqlite-0.0.3:=
		 >=dev-libs/putil-0.0.2:=
		 dev-libs/libbase64:=
         net-libs/gnutls
         sys-apps/util-linux
         sys-libs/ncurses
         www-client/lynx
         "

DEPEND="${RDEPEND}"

src_configure() {
        echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
        pconfigure
}
