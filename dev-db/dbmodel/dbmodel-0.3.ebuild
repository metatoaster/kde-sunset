# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Qt4 tool for drawing entity-relational diagrams"
HOMEPAGE="https://oxygene.sk/projects/dbmodel/"
SRC_URI="https://launchpad.net/dbmodel/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtsvg:4
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS CHANGES )

src_configure() {
	eqmake4 ${PN}.pro PREFIX=/usr
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs
}
