EAPI="4"
inherit eutils

DESCRIPTION="RISC-V port of GNU Binutils"
HOMEPAGE="https://github.com/ucb-bar/riscv-gcc"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz https://github.com/palmer-dabbelt/riscv-newlib/archive/v1.18.0.1.tar.gz -> newlib-1.18.0.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

src_prepare() {
    cp -r ${S}/../riscv-newlib-*/newlib ${S}
    cp -r ${S}/../riscv-newlib-*/libgloss ${S}
}

src_configure() {
    mkdir ${S}/build

    ${S}/configure \
          --target=riscv-elf \
          --program-prefix=riscv- \
          --prefix=$EPREFIX/usr \
          --disable-shared \
          --disable-threads \
          --enable-tls \
          --enable-languages=c,c++ \
          --with-newlib \
          --disable-libmudflap \
          --disable-libssp \
          --disable-libquadmath \
          --disable-libgomp \
          --disable-nls \
          CFLAGS="-O2 -pipe"
}

src_compile() {
    emake inhibit-libc=true all-gcc
}

src_install() {
    emake install-gcc DESTDIR=${ED}
    rm -rf ${ED}/usr/share/info
    rm -rf ${ED}/usr/share/man7
}
