EAPI="4"
inherit eutils flag-o-matic

DESCRIPTION="RISC-V Proxy Kernel"
HOMEPAGE="https://github.com/ucb-bar/riscv-pk"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-devel/riscv-fesvr
         sys-devel/riscv-gcc"

DEPEND="${RDEPEND}"

src_configure() {
    filter-flags "-march*"

    mkdir "${S}/build"
    cd "${S}/build"

    ../configure \
        --prefix=${EPREFIX}/usr \
        --host=riscv-elf \
        || die "configure failed"
}

src_compile() {
    mkdir "${S}/build"
    cd "${S}/build"

    filter-flags "-march*"
    make || die "make failed"
}

src_install() {
    mkdir "${S}/build"
    cd "${S}/build"

    filter-flags "-march*"
    make DESTDIR=${ED}/usr install || die "make install failed"
}
