EAPI="4"

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

src_configure() {
	cd "${S}"

	rm Configfile.local >& /dev/null || true
	touch Configfile.local

	echo "PREFIX = ${EPREFIX}/usr" >> Configfile.local

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
	mkdir -p ${D}${EPREFIX}/usr/bin
	mkdir -p ${D}${EPREFIX}/usr/lib
	mkdir -p ${D}${EPREFIX}/usr/include
	emake install D=${D} || die
	chmod oug-w ${D}${EPREFIX}/usr/bin/*
	chmod oug-w ${D}${EPREFIX}/usr/lib/*
}
