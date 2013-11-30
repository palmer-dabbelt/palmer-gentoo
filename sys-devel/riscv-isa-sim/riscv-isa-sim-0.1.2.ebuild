EAPI="4"
inherit eutils flag-o-matic

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
    econf --prefix=${EPREFIX}/usr \
          CFLAGS="-fPIC $CFLAGS" \
          CXXFLAGS="-fPIC $CXXFLAGS" \
          LDFLAGS="-fPIC -rdynamic $LDFLAGS" \
          CXX="g++ -fPIC"
}

src_install() {
    make DESTDIR=${ED}/usr install

    cp ${S}/riscv/pcr.h ${ED}/usr/include/spike/
    cp ${S}/riscv/disasm.h ${ED}/usr/include/spike/
    cp ${S}/config.h ${ED}/usr/include/spike/

    g++ \
        -Wl,--whole-archive \
        -rdynamic \
        ${ED}/usr/lib/spike/libriscv.a \
        -Wl,--no-whole-archive \
        -shared \
        -o ${ED}/usr/lib/libspike.so
}
