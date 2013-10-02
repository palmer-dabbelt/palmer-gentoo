EAPI="4"

DESCRIPTION="Palmer Dabbelt's script collection"
HOMEPAGE="http://dabbelt.com/~palmer/software/scripts/"
SRC_URI="https://github.com/palmer-dabbelt/scrpits/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
	 sys-devel/make
	 media-libs/libv4l
         net-dns/bind-tools
         net-analyzer/traceroute"

DEPEND="${RDEPEND}"

S="${WORKDIR}"/scrpits-${PV}

src_configure() {
	cd "${S}"

	rm Configfile.local >& /dev/null || true
	touch Configfile.local

	echo "PREFIX = ${EPREFIX}/usr" >> Configfile.local

	echo "LANGUAGES += c" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done
	echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local
	echo "COMPILEOPTS += -DPROCESSORS=\\\"$(grep -c "physical id" /proc/cpuinfo)\\\"" >> Configfile.local

	pconfigure || die "pconfigure failed"
}
