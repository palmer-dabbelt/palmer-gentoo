# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/perl/perl-5.18.2-r2.ebuild,v 1.12 2014/11/29 20:57:32 dilfridge Exp $

EAPI=5

inherit eutils alternatives flag-o-matic toolchain-funcs multilib multiprocessing autotools

PATCH_VER=2

PERL_OLDVERSEN="5.18.0 5.18.1"
MODULE_AUTHOR=RJBS

SHORT_PV="${PV%.*}"
MY_P="perl-${PV/_rc/-RC}"
MY_PV="${PV%_rc*}"

DESCRIPTION="Larry Wall's Practical Extraction and Report Language"

SRC_URI="
	mirror://cpan/src/5.0/${MY_P}.tar.bz2
	mirror://cpan/authors/id/${MODULE_AUTHOR:0:1}/${MODULE_AUTHOR:0:2}/${MODULE_AUTHOR}/${MY_P}.tar.bz2
	mirror://gentoo/${MY_P}-patches-${PATCH_VER}.tar.bz2
	http://dev.gentoo.org/~civil/distfiles/${CATEGORY}/${PN}/${MY_P}-patches-${PATCH_VER}.tar.bz2
        https://raw.github.com/arsv/${PN}-cross/releases/${P}-cross-0.8.5.tar.gz
"
HOMEPAGE="http://www.perl.org/"

LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0/${SHORT_PV}"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="berkdb debug doc gdbm ithreads"

RDEPEND="
	berkdb? ( sys-libs/db )
	gdbm? ( >=sys-libs/gdbm-1.8.3 )
	app-arch/bzip2
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	!prefix? ( elibc_FreeBSD? ( sys-freebsd/freebsd-mk-defs ) )
"
PDEPEND="
	>=app-admin/perl-cleaner-2.5
	>=virtual/perl-File-Temp-0.230.0
	!=perl-core/File-Temp-0.230.400
	>=virtual/perl-Data-Dumper-2.154.0
"
# bug 390719, bug 523624

S="${WORKDIR}/${MY_P}"

src_configure() {
        ./configure \
                    --prefix=${EPREFIX}/usr \
                    --target=${CHOST} \
        || die "Failed to run configure"
}
