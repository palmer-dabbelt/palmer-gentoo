EAPI="4"
inherit eutils

DESCRIPTION="Palmer Dabbelt's Configure Replacement"
HOMEPAGE="http://www.dabbelt.com/~palmer/software/pconfigure/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE="scala"

RDEPEND="dev-util/pkgconfig
         dev-util/strace
	 sys-devel/make
         sys-devel/gcc
         sys-libs/talloc
         scala? ( dev-lang/scala )
         "

DEPEND="${RDEPEND}"

src_prepare() {
        epatch "${FILESDIR}/${P}-shebang_prefix.patch"
}

src_configure() {
	echo "LANGUAGES += c" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done
	echo "COMPILEOPTS += -DSHEBANG_PREFIX=\\\"${EPREFIX}\\\""\
	     >> Configfile.local

        sh bootstrap.sh --prefix ${EPREFIX}/usr \
           || die "Failed to bootstap pconfigure"
}
