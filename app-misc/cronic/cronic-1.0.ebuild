EAPI="4"

DESCRIPTION="A cure for Cron's chronic email problem"
HOMEPAGE="http://habilis.net/cronic/"
SRC_URI="http://www.dabbelt.com/~palmer/software/cronic/release/cronic-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

RDEPEND="sys-devel/pconfigure
	 sys-devel/make"

DEPEND="${RDEPEND}"

src_configure() {
	rm Configfile.local >& /dev/null || true
	touch Configfile.local

	echo "PREFIX = ${EPREFIX}/usr" >> Configfile.local

	echo "LANGUAGES += c" >> Configfile.local
	for i in $(echo ${CFLAGS}); do
		echo "COMPILEOPTS += ${i}" >> Configfile.local
	done
	echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local
	echo "COMPILEOPTS += -DPROCESSORS=\\\"$(grep -c "physical id" /proc/cpuinfo)\\\"" >> Configfile.local

	pconfigure
}

src_install() {
	mkdir -p ${D}${EPREFIX}/usr/bin
	mkdir -p ${D}${EPREFIX}/usr/lib
	mkdir -p ${D}${EPREFIX}/usr/include
	emake install D=${D} || die
	chmod oug-w ${D}${EPREFIX}/usr/bin/*
	chmod oug-w ${D}${EPREFIX}/usr/lib/*
}
