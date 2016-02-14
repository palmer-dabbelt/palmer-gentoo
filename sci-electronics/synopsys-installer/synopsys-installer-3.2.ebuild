EAPI=5

DESCRIPTION="Synopsys's Software Installer"
HOMEPAGE="http://www.synopsys.com/install"
SRC_URI="SynopsysInstaller_v3.2.run"
RESTRICT="fetch strip"

LICENSE=""
SLOT="${PV}"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}"
}

src_install() {
   perl "${DISTDIR}/${A}" -dir ${ED}/opt/synopsys/installer/${PV}
}
