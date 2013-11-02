EAPI="4"
inherit eutils flag-o-matic

DESCRIPTION="RISC-V port of GNU Binutils"
HOMEPAGE="https://github.com/ucb-bar/riscv-gcc"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz https://github.com/palmer-dabbelt/riscv-newlib/archive/v1.18.0.1.tar.gz -> newlib-1.18.0.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-devel/riscv-binutils"

DEPEND="${RDEPEND}"

# We can't strip this ebuild because the x86 strip code won't
# understand these binaries and will therefor output bad values
RESTRICT="strip"

src_prepare() {
    cp -r ${S}/../riscv-newlib-*/newlib ${S}
    cp -r ${S}/../riscv-newlib-*/libgloss ${S}
}

src_configure() {
    filter-flags "-march*"

    mkdir ${S}/build
    cd ${S}/build

    ${S}/build/../configure \
          --target=riscv-elf \
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
          --disable-nls
}

src_compile() {
    cd ${S}/build
    emake || die "make failed"
}

src_install() {
    cd ${S}/build
    make install DESTDIR=${ED}
    rm -rf ${ED}/usr/share/info
    rm -rf ${ED}/usr/share/man7
}
