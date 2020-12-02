# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="phonon-backend-gstreamer"
MY_P=${MY_PN}-${PV}
inherit cmake-utils multibuild

DESCRIPTION="Phonon GStreamer backend"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${MY_PN}/${PV}/${MY_P}.tar.xz"

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86 ~x64-macos"
IUSE="alsa debug +network qt4 +qt5"

REQUIRED_USE="|| ( qt4 qt5 )"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libxml2:2
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	>=media-libs/phonon-4.9.0[qt4(-)?,qt5(+)?]
	media-plugins/gst-plugins-meta:1.0[alsa?,ogg,vorbis]
	virtual/opengl
	network? ( media-plugins/gst-plugins-soup:1.0 )
	qt4? (
		>=dev-qt/qtcore-4.8.7-r2:4[glib]
		>=dev-qt/qtgui-4.8.7:4[glib]
		>=dev-qt/qtopengl-4.8.7:4
		!<dev-qt/qtwebkit-4.10.4:4[gstreamer]
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtopengl:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5
	)
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

pkg_setup() {
	MULTIBUILD_VARIANTS=( $(usev qt4) $(usev qt5) )
}

src_configure() {
	myconfigure() {
		local mycmakeargs=()
		if [[ ${MULTIBUILD_VARIANT} = qt4 ]]; then
			mycmakeargs+=( -DPHONON_BUILD_PHONON4QT5=OFF )
		fi
		if [[ ${MULTIBUILD_VARIANT} = qt5 ]]; then
			mycmakeargs+=( -DPHONON_BUILD_PHONON4QT5=ON )
		fi
		cmake-utils_src_configure
	}

	multibuild_foreach_variant myconfigure
}

src_compile() {
	multibuild_foreach_variant cmake-utils_src_compile
}

src_test() {
	multibuild_foreach_variant cmake-utils_src_test
}

src_install() {
	multibuild_foreach_variant cmake-utils_src_install
}
