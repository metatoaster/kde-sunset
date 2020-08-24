# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Universal graphical front-end for command line programs"
HOMEPAGE="http://kaptain.sourceforge.net/"
SRC_URI="mirror://sourceforge/kaptain/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:4[qt3support]
	dev-qt/qt3support:4
"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake4
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README TODO
}
