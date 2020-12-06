# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=55776dc9c51d7153c66402b257f7a0992f9d4ae5
KDE_ORG_NAME="polkit-qt-1"
inherit cmake kde.org

DESCRIPTION="Qt wrapper around polkit-1 client libraries"
HOMEPAGE="https://api.kde.org/kdesupport-api/polkit-qt-1-apidocs/"
SRC_URI="https://invent.kde.org/libraries/${KDE_ORG_NAME}/-/archive/${COMMIT}/${KDE_ORG_NAME}-${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${KDE_ORG_NAME}-${COMMIT}"

LICENSE="LGPL-2"
SLOT="0-qt4"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86"
IUSE="debug"

RDEPEND="
	dev-libs/glib:2
	dev-qt/qtcore:4[glib]
	dev-qt/qtdbus:4
	dev-qt/qtgui:4[glib]
	>=sys-auth/polkit-0.103
"
DEPEND="${RDEPEND}
	!<sys-auth/polkit-qt-0.113:0
"

DOCS=( AUTHORS README README.porting TODO )

src_configure() {
	local mycmakeargs=(
		-DSYSCONF_INSTALL_DIR="${EPREFIX}"/etc
		-DBUILD_EXAMPLES=OFF
		-DUSE_QT4=ON
	)
	cmake_src_configure
}
