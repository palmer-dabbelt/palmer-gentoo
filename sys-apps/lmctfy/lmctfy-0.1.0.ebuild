EAPI="4"
inherit eutils

DESCRIPTION="lmctfy is the open source version of Google’s container stack, which provides Linux application containers."
HOMEPAGE="https://github.com/palmer-dabbelt/lmctfy"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/protobuf
        dev-cpp/gflags
        dev-libs/re2
        >=sys-devel/gcc-4.7"

DEPEND="${RDEPEND}"

src_configure() {
        :
}
