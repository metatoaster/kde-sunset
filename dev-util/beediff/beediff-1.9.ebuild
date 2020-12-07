# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils xdg

DESCRIPTION="Graphical user interface for comparing and merging files"
HOMEPAGE="http://www.beesoft.pl/index.php?id=beediff"
SRC_URI="http://www.beesoft.pl/download/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	default
	sed -e '/QMAKE_CXXFLAGS/d' -i beediff.pro || die
}

src_configure() {
	eqmake4
}

src_install() {
	dobin ${PN}
	doicon img/${PN}.png
	make_desktop_entry ${PN} "Beesoft Differ" ${PN} "Qt;Development;"
	dodoc ChangeLog.txt
}
