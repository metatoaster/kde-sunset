# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
KDE_REQUIRED="optional"
CPPUNIT_REQUIRED="optional"
inherit kde4-base

DESCRIPTION="Generic geographical map widget"
HOMEPAGE="https://marble.kde.org/"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug designer-plugin +kde phonon plasma shapefile test zip"

# tests fail / segfault. Last checked for 4.9.0
RESTRICT="test"

RDEPEND="
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtdeclarative:4
	dev-qt/qtgui:4
	dev-qt/qtscript:4
	dev-qt/qtsql:4
	dev-qt/qtsvg:4
	dev-qt/qtwebkit:4
	designer-plugin? ( dev-qt/designer:4 )
	kde? ( media-libs/phonon:0-qt4 )
	phonon? ( media-libs/phonon:0-qt4 )
	shapefile? ( sci-libs/shapelib )
	zip? ( dev-libs/quazip )
"
DEPEND="
	${RDEPEND}
	test? ( dev-qt/qttest:4 )
"
# the qt dependencies are needed because with USE=-kde nothing is pulled in
# by default... bugs 414165 & 429346

REQUIRED_USE="plasma? ( kde )"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with designer-plugin DESIGNER_PLUGIN)
		$(cmake-utils_use !kde QTONLY)
		$(cmake-utils_use_with phonon)
		$(cmake-utils_use_with plasma)
		$(cmake-utils_use_with shapefile libshp)
		$(cmake-utils_use_with zip quazip)
		-DBUILD_MARBLE_TESTS=OFF
		-DWITH_liblocation=0
		-DEXPERIMENTAL_PYTHON_BINDINGS=OFF
		-DWITH_PythonLibrary=OFF
		-DWITH_PyQt4=OFF
		-DWITH_SIP=OFF
		-DWITH_QextSerialPort=OFF
		-DWITH_libgps=OFF
	)

	kde4-base_src_configure
}

src_test() {
	if use kde; then
		elog "Marble tests can only be run in the qt-only version"
	else
		local mycmakeargs=(
			-DBUILD_MARBLE_TESTS=ON
		)
		kde4-base_src_test
	fi
}
