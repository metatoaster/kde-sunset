# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="phonon-backend-vlc"
inherit cmake

DESCRIPTION="Phonon VLC backend"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${MY_PN}/${PV}/${MY_PN}-${PV}.tar.xz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0-qt4"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86"
IUSE="debug"

DEPEND="
	>=dev-qt/qtcore-4.8.7-r2:4
	>=dev-qt/qtgui-4.8.7:4
	media-libs/phonon:0-qt4
	media-video/vlc:=[dbus,ogg,vorbis]
"
RDEPEND="${DEPEND}
	!<media-libs/phonon-vlc-0.11:0
"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=( -DPHONON_BUILD_PHONON4QT5=OFF )
	cmake_src_configure
}
