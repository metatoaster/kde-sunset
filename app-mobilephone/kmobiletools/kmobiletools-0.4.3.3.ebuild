# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit kde

DESCRIPTION="KDELibs-based application that allows to control mobile phones with your PC"
HOMEPAGE="http://www.kmobiletools.org/"
SRC_URI="mirror://sourceforge/${PN}.berlios/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

need-kde 3.5

src_unpack() {
	kde_src_unpack

	rm -f "${S}/configure"
}
