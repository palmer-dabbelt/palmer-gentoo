EAPI="5"
inherit waf-utils

DESCRIPTION="Seek"
HOMEPAGE="https://github.com/zougloub/libseek/"
SRC_URI="https://github.com/zougloub/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
http://ftp.waf.io/pub/release/waf-1.8.5"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

src_prepare() {
        cp "${DISTDIR}"/waf-1.8.5 waf
        chmod +x waf

        epatch "${FILESDIR}"/${P}-shared_library.patch
}

# note: libseek waf fails when passed --libdir:
# waf: error: no such option: --libdir
src_configure() {
	${WAF_BINARY:="${S}/waf"}

	tc-export AR CC CPP CXX RANLIB
	echo "CCFLAGS=\"${CFLAGS}\" LINKFLAGS=\"${LDFLAGS}\" \"${WAF_BINARY}\" --prefix=${EPREFIX}/usr $@ configure"

	CCFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" "${WAF_BINARY}" \
		"--prefix=${EPREFIX}/usr" \
		"$@" \
		configure || die "configure failed"
}
