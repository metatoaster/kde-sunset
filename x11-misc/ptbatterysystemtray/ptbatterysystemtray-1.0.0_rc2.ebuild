# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg

DESCRIPTION="A simple battery monitor in the system tray"
HOMEPAGE="https://sourceforge.net/projects/batterysystem/"
SRC_URI="http://ponce.cc/slackware/sources/repo/${P/_/.}.tar.bz2"
S="${WORKDIR}/${P/_/.}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "/^Categories/s/Application;//" -i ptbatterysystemtray.desktop || die
}

src_configure() {
	eqmake4 ${PN}.pro INSTALL_PREFIX=/usr
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs
}
