EAPI="2"
inherit eutils

DESCRIPTION="Chisel wiring language"
HOMEPAGE="https://chisel.eecs.berkeley.edu/"
SRC_URI="https://github.com/ucb-bar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND=">=sys-devel/pconfigure-0.5.2
         >=dev-lang/scala-2.10.0"

DEPEND="${RDEPEND}"

src_prepare() {
        epatch "${FILESDIR}/${P}-pconfigure.patch"
        epatch "${FILESDIR}/${P}-emulator_wall.patch"
}

src_configure() {
	rm Configfile.local >& /dev/null || true
	echo "PREFIX = ${EPREFIX}/usr" >> Configfile.local
	pconfigure || die "pconfigure failed"
}

src_install() {
        make D=$D install
}
