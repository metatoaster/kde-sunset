# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit kde

DESCRIPTION="KDE Plasma fullscreen task manager"
HOMEPAGE="http://kompose.berlios.de"
SRC_URI="mirror://sourceforge/${PN}.berlios/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""

DEPEND="media-libs/imlib2"
RDEPEND="${DEPEND}"
need-kde 3.5

PATCHES=( "${FILESDIR}/${P}-ktoolbar-patch" )

function pkg_setup() {
	# bug 94881
	if ! built_with_use media-libs/imlib2 X; then
		eerror "This package requires imlib2 to be built with X11 support."
		eerror "Please run USE=X emerge media-libs/imlib2, then try emerging kompose again."
		die "imlib2 must be built with USE=X"
	fi
}

src_compile() {
	rm configure
	kde_src_compile
}
