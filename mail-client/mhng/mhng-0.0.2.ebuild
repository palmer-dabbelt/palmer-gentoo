EAPI="4"
inherit eutils

DESCRIPTION="A modern MH clone"
HOMEPAGE="http://www.dabbelt.com/~palmer/software/mhng/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="app-cript/gpgme
         dev-db/sqlite
         dev-libs/gitdate
         net-libs/gnutls
         sys-apps/util-linux
         sys-libs/ncurses
         www-client/lynx
         "

DEPEND="${RDEPEND}"

src_prepare() {
        epatch "${FILESDIR}/${P}-write_return.patch"
        epatch "${FILESDIR}/${P}-fgets_return.patch"
        epatch "${FILESDIR}/${P}-system_return.patch"
}

src_configure() {
	echo "LANGUAGES += c++" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done
	echo "COMPILEOPTS += -DPBASHC_SHEBANG=\\\"\#\!${EPREFIX}/bin/bash\\\""\
	     >> Configfile.local

        pconfigure
}
