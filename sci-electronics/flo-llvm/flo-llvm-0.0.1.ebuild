EAPI="5"

inherit eutils

DESCRIPTION="Converts Flo files to LLVM files"
HOMEPAGE="http://dabbelt.com/~palmer/software/${PN}/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         dev-libs/libflo:=
         sys-devel/llvm
         sys-devel/clang"

DEPEND="${RDEPEND}"

src_prepare() {
        epatch "${FILESDIR}/${P}-strncat.bash"
}

src_configure() {
	echo "PREFIX = ${EPREFIX}/usr" > Configfile.local

	echo "LANGUAGES += c" >> Configfile.local
	echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local

	pconfigure --verbose || die "pconfigure failed"
}

src_install() {
        make D=$D install
}
