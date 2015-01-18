EAPI="5"
inherit eutils

DESCRIPTION="Eye-Fi Configuration Tool"
HOMEPAGE="http://sr71.net/projects/eyefi/"
SRC_URI="http://sr71.net/projects/eyefi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE="scala"

RDEPEND="sys-devel/make
         sys-devel/gcc
         "

DEPEND="${RDEPEND}"

src_install() {
        install -d ${D}/usr/bin
        install eyefi-config ${D}/usr/bin
}
