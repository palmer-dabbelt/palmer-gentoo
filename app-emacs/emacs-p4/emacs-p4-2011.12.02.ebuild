EAPI="4"

DESCRIPTION="Perforce Integration for emacs"
HOMEPAGE="http://public.perforce.com/wiki/Emacs_VC-P4"
SRC_URI="http://dabbelt.com/~palmer/software/mirror/emacs-p4-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 amd64-linux"
IUSE=""

DEPEND="app-editors/emacs"

src_install() {
        cd "${S}"
        pwd
        mkdir -p "${D}/${EPREFIX}/usr/share/emacs/site-lisp/p4"
        cp vc-p4.el "${D}/${EPREFIX}/usr/share/emacs/site-lisp/p4"
        cp p4-lowlevel.el "${D}/${EPREFIX}/usr/share/emacs/site-lisp/p4"
}
