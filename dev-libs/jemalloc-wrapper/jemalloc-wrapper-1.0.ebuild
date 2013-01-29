EAPI="4"

DESCRIPTION="jemalloc wrapper for firefox"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64-linux ~amd64-linux"
IUSE=""

DEPEND="dev-libs/jemalloc"

src_unpack() {
	mkdir -p "${S}"
}

src_install() {
	mkdir -p "${ED}"/usr/include
	echo "#include <jemalloc/jemalloc.h>" > "${ED}"/usr/include/jemalloc.h
}
