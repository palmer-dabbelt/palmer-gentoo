EAPI="4"
inherit eutils

DESCRIPTION="RISC-V port of GNU Binutils"
HOMEPAGE="https://github.com/ucb-bar/riscv-gcc"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

src_configure() {
    ${S}/configure \
          --target=riscv-elf \
          --prefix=$EPREFIX/usr
}

src_install() {
    emake install DESTDIR=${ED}
    rm -rf ${ED}/usr/share/locale
    rm -rf ${ED}/usr/share/info
    rm -rf ${ED}/usr/lib64/libiberty.a
}
