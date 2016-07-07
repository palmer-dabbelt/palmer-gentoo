EAPI="5"
inherit eutils cmake-utils

DESCRIPTION="C++ JSON Parsing Library"
HOMEPAGE="https://github.com/nlohmann/json"
SRC_URI="https://github.com/nlohmann/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/$PV"
KEYWORDS="amd64 amd64-linux"

RDEPEND=""

DEPEND="${RDEPEND}"
