EAPI="5"
inherit eutils autotools

DESCRIPTION="Git's date parsing code"
HOMEPAGE="https://github.com/kisom/libbase64"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"

RDEPEND=""

DEPEND="${RDEPEND}"

src_prepare() {
        eautoreconf
		epatch_user
}
