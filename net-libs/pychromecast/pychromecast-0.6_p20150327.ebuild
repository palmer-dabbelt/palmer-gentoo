EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Library for Python 2 and 3 to communicate with the Google Chromecast."
HOMEPAGE="https://github.com/balloob/pychromecast"

EGIT_REPO_URI="https://github.com/balloob/pychromecast"
EGIT_COMMIT="9d1421943af11dd8b61d7ed49fc97514edb15f43"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
