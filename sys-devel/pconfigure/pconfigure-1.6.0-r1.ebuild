EAPI="4"
inherit eutils

DESCRIPTION="Palmer Dabbelt's Configure Replacement"
HOMEPAGE="http://dabbelt.com/~palmer/software/pconfigure/"
SRC_URI="http://www.dabbelt.com/~palmer/software/pconfigure/release/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"

RDEPEND="sys-devel/clang
         dev-util/pkgconfig
	 sys-devel/make
         sys-devel/gcc
         sys-libs/talloc"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-make_install.patch
}

src_configure() {
	cd "${S}"

	rm Configfile.local >& /dev/null || true
	touch Configfile.local

	echo "PREFIX = ${D}${EPREFIX}/usr" >> Configfile.local

	echo "LANGUAGES += c" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done
	echo "COMPILEOPTS += -DPBASHC_SHEBANG=\\\"\#\!${EPREFIX}/bin/bash\\\""\
	     >> Configfile.local
}

src_compile() {
	sh bootstrap.sh || die "Failed to bootstap pconfigure"
}

src_install() {
	emake install || die
}
