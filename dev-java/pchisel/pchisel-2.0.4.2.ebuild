EAPI="2"

DESCRIPTION="Chisel wiring language"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND=">=sys-devel/pconfigure-0.5.2
         >=dev-lang/scala-2.10.0"

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
