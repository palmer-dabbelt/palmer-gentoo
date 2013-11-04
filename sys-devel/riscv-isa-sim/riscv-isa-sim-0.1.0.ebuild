EAPI="4"
inherit eutils

DESCRIPTION="Spike: A RISC-V Functional Simulator"
HOMEPAGE="https://github.com/ucb-bar/riscv-isa-sim"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

PDEPEND="sys-devel/riscv-pk"

DEPEND="sys-devel/riscv-fesvr"

src_configure() {
    econf --prefix=${EPREFIX}/usr
}

src_install() {
    make DESTDIR=${ED}/usr install
}
