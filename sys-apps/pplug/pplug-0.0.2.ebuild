EAPI="5"
inherit eutils user

DESCRIPTION="A daemon-less hotplug management system"
HOMEPAGE="http://github.com/palmer-dabbelt/pplug/"
SRC_URI="https://github.com/palmer-dabbelt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
         >=dev-libs/psqlite-0.0.3:=
		 >=dev-libs/putil-0.0.2:=
		 dev-libs/libbase64:=
         "

DEPEND="${RDEPEND}"

src_configure() {
        echo "PREFIX = ${EPREFIX}/usr" > Configfile.local
        pconfigure
}

pkg_setup() {
        enewgroup pplug
}

src_install() {
		emake DESTDIR="${ED}" install
		doinitd "${FILESDIR}/pplug"
}
