# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DECLARATIVE_REQUIRED="always"
KDE_HANDBOOK="optional"
KMNAME="kde-workspace"
KMMODULE="plasma"
OPENGL_REQUIRED="always"
WEBKIT_REQUIRED="always"
inherit kde4-meta

DESCRIPTION="Plasma: KDE desktop framework"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="debug gps json +pim qalculate"

COMMONDEPEND="
	dev-libs/libdbusmenu-qt
	>=dev-qt/qtcore-4.8.4-r3:4
	kde-frameworks/kactivities:4
	kde-plasma/kephal:4
	kde-plasma/ksysguard:4
	kde-plasma/libkworkspace:4
	kde-plasma/libplasmaclock:4[pim?]
	kde-plasma/libplasmagenericshell:4
	kde-plasma/libtaskmanager:4
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrender
	gps? ( >=sci-geosciences/gpsd-2.37 )
	json? ( dev-libs/qjson )
	pim? ( $(add_kdeapps_dep kdepimlibs) )
	qalculate? ( sci-libs/libqalculate )
"
DEPEND="${COMMONDEPEND}
	dev-libs/boost
	x11-base/xorg-proto
"
RDEPEND="${COMMONDEPEND}
	$(add_kdeapps_dep plasma-runtime)
"

PATCHES=(
   "${FILESDIR}/${P}-webkit.patch"
)

KMEXTRA="
	appmenu/
	ktouchpadenabler/
	statusnotifierwatcher/
"
KMEXTRACTONLY="
	kcheckpass/
	krunner/dbus/org.freedesktop.ScreenSaver.xml
	krunner/dbus/org.kde.krunner.App.xml
	ksmserver/org.kde.KSMServerInterface.xml
	ksmserver/screenlocker/
	libs/kephal/
	libs/kworkspace/
	libs/taskmanager/
	libs/plasmagenericshell/
	libs/ksysguard/
	libs/kdm/kgreeterplugin.h
	ksysguard/
"

src_unpack() {
	if use handbook; then
		KMEXTRA+=" doc/plasma-desktop"
	fi

	kde4-meta_src_unpack
}

src_configure() {
	local mycmakeargs=(
		-DWITH_NepomukCore=OFF
		-DWITH_Soprano=OFF
		-DWITH_Xmms=OFF
		-DWITH_KDEWEBKIT=OFF
		$(cmake-utils_use_with gps libgps)
		$(cmake-utils_use_with json QJSON)
		$(cmake-utils_use_with pim Akonadi)
		$(cmake-utils_use_with pim KdepimLibs)
		-DWITH_PythonLibs=OFF
		$(cmake-utils_use_with qalculate)
	)

	kde4-meta_src_configure
}

src_install() {
	kde4-meta_src_install
}
