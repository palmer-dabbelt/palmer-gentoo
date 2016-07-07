EAPI=5
inherit user

DESCRIPTION="Synopsys MilkyWay"
HOMEPAGE="http://www.synopsys.com/milkyway"
SRC_URI="mw_vK-2015.06-SP5-2_common.spf mw_vK-2015.06-SP5-2_linux64.spf mw_vK-2015.06-SP5-2_SI32.tar"
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
   PRODUCT="$(echo ${PN} | cut -d- -f2)"
   ${INSTALLER_HOME}/installer -install_as_root -batch_installer -source ${S} -target ${ED}/opt/synopsys
   test -d ${ED}/opt/synopsys/${PRODUCT} || die "installer failed"
}
