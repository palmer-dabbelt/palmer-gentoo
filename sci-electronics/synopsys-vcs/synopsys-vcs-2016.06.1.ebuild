EAPI=5
inherit user

DESCRIPTION="Synopsys VCS"
HOMEPAGE="http://www.synopsys.com/vcs"
SRC_URI="vcs_vL-2016.06-1_common.spf vcs_vL-2016.06-1_linux64.spf vcs_vL-2016.06-1_linux.spf"
RESTRICT="fetch strip"

LICENSE=""
SLOT="${PV}"
KEYWORDS="~amd64"
IUSE=""

INSTALLER_VERSION="3.2"

DEPEND="sci-electronics/synopsys-installer:${INSTALLER_VERSION}"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}"
	cd ${DISTDIR}
	cp --reflink=auto ${A} ${S}
}

src_install() {
   INSTALLER_HOME="${EPREFIX}/opt/synopsys/installer/${INSTALLER_VERSION}"
   PRODUCT=vcs
   ${INSTALLER_HOME}/installer -install_as_root -batch_installer -source ${S} -target ${ED}/opt/synopsys
   test -d ${ED}/opt/synopsys/${PRODUCT} || die "installer failed"
}
