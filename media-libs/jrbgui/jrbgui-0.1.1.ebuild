EAPI="4"
inherit eutils

DESCRIPTION="Jonathan Bachrach's GUI Library"
HOMEPAGE="https://github.com/jackbackrack/gui"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

BDEPEND=">=sys-devel/pconfigure-0.5.1
         media-libs/portmidi
         media-libs/portaudio
         media-libs/freeglut
         media-libs/glu
         media-libs/ilmbase
         media-libs/opencv"

src_configure() {
    pconfigure
}

src_install() {
    make D=${ED} install
}
