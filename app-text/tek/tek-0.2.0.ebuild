EAPI="2"

DESCRIPTION="A simple Makefile generator for LaTeX"
HOMEPAGE="http://dabbelt.com/~palmer/software/tek/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         sys-devel/make
	 dev-tex/tex4ht
	 media-gfx/xfig
	 media-gfx/imagemagick
	 sci-visualization/gnuplot"

DEPEND="${RDEPEND}"

src_configure() {
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

src_install() {
        make D=$D install
}
