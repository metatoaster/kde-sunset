# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="A simple tool for comparing two linux kernel .config files"
HOMEPAGE="http://stoopidsimple.com/kccmp/"
SRC_URI="http://stoopidsimple.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	echo "DEFINES += KCCMP_QT_4" >> ${PN}.pro
}

src_configure() {
	eqmake4
}

src_install() {
	dobin kccmp
	dodoc README
}
