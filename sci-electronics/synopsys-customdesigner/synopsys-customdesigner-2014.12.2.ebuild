EAPI=5
inherit user

DESCRIPTION="Synopsys's Software Installer"
HOMEPAGE="http://www.synopsys.com/install"
SRC_URI="customdesigner_vJ-2014.12-SP2-2_amd64.spf customdesigner_vJ-2014.12-SP2-2_SI32.tar customdesigner_vJ-2014.12-SP2-2_common.spf"
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

   cd ${ED}/opt/synopsys/${PRODUCT}/*/amd64/OA/lib
   ln -s $(find * -maxdepth 0 -type d) unknown_64
}
