# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

COMMIT="a28ff105e76a227b799c2bbf6e732791de5fb84e"
inherit kde4-base

DESCRIPTION="Video player plugin for Konqueror and basic MPlayer frontend"
HOMEPAGE="https://kmplayer.kde.org"
SRC_URI="https://github.com/KDE/kmplayer/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 FDL-1.2 LGPL-2.1"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="cairo debug expat"

DEPEND="
	media-libs/phonon:0-qt4
	x11-libs/libX11
	cairo? (
		x11-libs/cairo
		x11-libs/pango
	)
	expat? ( >=dev-libs/expat-2.0.1 )
"
RDEPEND="${DEPEND}
	media-video/mplayer
"

PATCHES=( "${FILESDIR}/${PN}-0.11.3d-cmake34.patch" )

S="${WORKDIR}/${PN}-${COMMIT}"

src_prepare() {
	sed -e '/add_subdirectory(icons)/d' \
		-i CMakeLists.txt || die

	kde4-base_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DKMPLAYER_BUILT_WITH_CAIRO=$(usex cairo)
		-DKMPLAYER_BUILT_WITH_EXPAT=$(usex expat)
		-DKMPLAYER_BUILT_WITH_NPP=OFF
	)

	kde4-base_src_configure
}
