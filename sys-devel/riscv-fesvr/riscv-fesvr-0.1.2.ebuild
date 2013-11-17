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

BDEPEND=">=sys-devel/pconfigure-0.5.1"

src_configure() {
    pconfigure
}

src_install() {
    make D=${ED} install
}
