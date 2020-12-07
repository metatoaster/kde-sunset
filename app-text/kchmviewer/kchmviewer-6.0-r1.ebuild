# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_REQUIRED="optional"
KDE_LINGUAS_DIR="po"
inherit desktop kde4-base xdg-utils

DESCRIPTION="A feature rich chm file viewer, based on Qt"
HOMEPAGE="https://www.ulduzsoft.com/linux/kchmviewer/"
SRC_URI="mirror://sourceforge/kchmviewer/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug kde"

DEPEND="
	dev-libs/chmlib
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
	dev-qt/qtwebkit:4
	kde? ( kde-frameworks/kdelibs:4 )
"
RDEPEND="${DEPEND}
	kde? ( !kde-apps/okular[chm] )
"

pkg_setup() {
	use kde && kde4-base_pkg_setup
}

src_prepare() {
	if use kde; then
		kde4-base_src_prepare
	else
		default
	fi
	sed -e "s:KDE4_ICON_INSTALL_DIR:ICON_INSTALL_DIR:" \
		-e "s:KDE4_XDG_APPS_INSTALL_DIR:XDG_APPS_INSTALL_DIR:" \
			-i packages/CMakeLists.txt || die
	sed -e "s:KDE4_BIN_INSTALL_DIR:BIN_INSTALL_DIR:" \
			-i src/CMakeLists.txt || die
	echo "CONFIG += ordered" >> kchmviewer.pro # parallel build fix #281954

	sed -e "/Encoding=UTF-8/d" \
		-i packages/kchmviewer.desktop || die "fixing .desktop file failed"
}

src_configure() {
	if use kde; then
		kde4-base_src_configure
	else
		eqmake4
	fi
}

src_compile() {
	if use kde; then
		kde4-base_src_compile
	else
		default
	fi
}

src_install() {
	if use kde; then
		kde4-base_src_install
	else
		dobin bin/kchmviewer
		domenu packages/kchmviewer.desktop
		dodoc ChangeLog README
	fi
	doicon packages/kchmviewer.png
	dodoc DBUS-bindings FAQ
}

pkg_postinst() {
	use kde && kde4-base_pkg_postinst
	xdg_desktop_database_update
}

pkg_postrm() {
	use kde && kde4-base_pkg_postrm
	xdg_desktop_database_update
}
