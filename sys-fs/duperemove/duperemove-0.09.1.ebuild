EAPI="5"
inherit eutils

DESCRIPTION="Tools for deduping file systems"
HOMEPAGE="https://github.com/markfasheh/duperemove"
SRC_URI="https://github.com/markfasheh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-crypt/gnupg
         dev-libs/libgcrypt
         dev-libs/glib"

DEPEND="${RDEPEND}"
