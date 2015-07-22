EAPI="4"
inherit eutils

DESCRIPTION="Ubuntu's distribution keys"
HOMEPAGE="http://packages.ubuntu.com/precise/misc/ubuntu-keyring"
SRC_URI="http://archive.ubuntu.com/ubuntu/pool/main/u/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="scala"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
        mkdir -p ${ED}/usr/share/keyrings
        tar -C keyrings -cv . | tar -x -C ${ED}/usr/share/keyrings
        chmod og-w -R ${ED}/usr/share/keyrings
}
