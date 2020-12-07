# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils

DESCRIPTION="X11 touch pad driver configuration utility"
HOMEPAGE="https://www.linux-apps.com/p/1127843"
SRC_URI="http://www.fit.vutbr.cz/~kombrink/personal/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	x11-libs/libX11
"
RDEPEND="${DEPEND}
	x11-drivers/xf86-input-synaptics
"

PATCHES=( "${FILESDIR}"/${P}-underlinking.patch )

src_configure() {
	eqmake4
}

src_install() {
	dobin ${PN}
	newicon res/touchpad.svg ${PN}.svg
	einstalldocs
	make_desktop_entry ${PN} TouchFreeze ${PN} 'Qt;System'
}
