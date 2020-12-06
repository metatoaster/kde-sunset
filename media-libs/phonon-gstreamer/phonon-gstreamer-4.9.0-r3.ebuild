# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="phonon-backend-gstreamer"
MY_P=${MY_PN}-${PV}
inherit cmake xdg-utils

DESCRIPTION="Phonon GStreamer backend"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${MY_PN}/${PV}/${MY_P}.tar.xz"

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0-qt4"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86"
IUSE="alsa debug minimal +network"

DEPEND="
	dev-libs/glib:2
	dev-libs/libxml2:2
	>=dev-qt/qtcore-4.8.7-r2:4[glib]
	>=dev-qt/qtgui-4.8.7:4[glib]
	>=dev-qt/qtopengl-4.8.7:4
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	media-libs/phonon:0-qt4
	media-plugins/gst-plugins-meta:1.0[alsa?,ogg,vorbis]
	virtual/opengl
	network? ( media-plugins/gst-plugins-soup:1.0 )
"
RDEPEND="${DEPEND}
	!<dev-qt/qtwebkit-4.10.4:4[gstreamer]
	!<media-libs/phonon-gstreamer-4.10:0
"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}/${P}-no-paused-on-zero-vol.patch" )

src_prepare() {
	cmake_src_prepare
	use minimal && cmake_run_in gstreamer cmake_comment_add_subdirectory icons
}

src_configure() {
	local mycmakeargs=( -DPHONON_BUILD_PHONON4QT5=OFF )
	cmake_src_configure
}

pkg_postinst() {
	use minimal || xdg_icon_cache_update
}

pkg_postrm() {
	use minimal || xdg_icon_cache_update
}
