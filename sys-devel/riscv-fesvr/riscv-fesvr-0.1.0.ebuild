EAPI="4"
inherit eutils

DESCRIPTION="RISC-V Front End Server"
HOMEPAGE="https://github.com/ucb-bar/riscv-fesvr"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

src_prepare() {
    epatch "${FILESDIR}/${P}-version.patch"
}

src_configure() {
    econf --prefix=${EPREFIX}/usr
}

src_install() {
    make DESTDIR=${ED}/usr install
}
