EAPI="2"

DESCRIPTION="A simple videochat application"
HOMEPAGE="http://dabbelt.com/~palmer/software/videochat/"
SRC_URI="http://www.dabbelt.com/~palmer/software/videochat/release/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make"

DEPEND="${RDEPEND}"

src_configure() {
	cd "${S}"

	rm Configfile.local >& /dev/null || true
	touch Configfile.local

	echo "PREFIX = ${D}${EPREFIX}/usr" >> Configfile.local

	echo "LANGUAGES += c" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done

	pconfigure
}

src_compile() {
	cd "${S}"
	emake || die
}

src_install() {
	emake install || die
}
