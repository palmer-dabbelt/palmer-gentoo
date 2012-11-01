EAPI="2"

DESCRIPTION="A simple Makefile generator for LaTeX"
HOMEPAGE="http://dabbelt.com/~palmer/software/tek/"
SRC_URI="http://www.dabbelt.com/~palmer/software/tek/release/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make
	 app-text/pandoc"

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
	echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local

	pconfigure
}

src_compile() {
	cd "${S}"
	emake || die
}

src_install() {
	mkdir -p ${D}${EPREFIX}/usr/bin
	mkdir -p ${D}${EPREFIX}/usr/lib
	mkdir -p ${D}${EPREFIX}/usr/include
	emake install D=${D} || die
	chmod oug-w ${D}${EPREFIX}/usr/bin/*
	chmod oug-w ${D}${EPREFIX}/usr/lib/*
}
