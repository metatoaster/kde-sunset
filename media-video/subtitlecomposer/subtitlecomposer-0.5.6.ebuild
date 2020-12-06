# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_LINGUAS="bg cs de el es fr hu pl pt_BR ru sr sr@latin uk"
KDE_LINGUAS_LIVE_OVERRIDE="true"
inherit kde4-base

DESCRIPTION="Text-based subtitles editor"
HOMEPAGE="https://github.com/maxrd2/subtitlecomposer"
SRC_URI="https://github.com/maxrd2/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"
SLOT="4"
IUSE="debug unicode xine"

RDEPEND="
	media-libs/phonon:0-qt4
	unicode? ( dev-libs/icu:= )
	xine? ( media-libs/xine-lib )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

src_configure() {
	mycmakeargs=(
		-DWITH_GStreamer=OFF
		$(cmake-utils_use_with unicode ICU)
		$(cmake-utils_use_with xine)
	)
	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	echo
	elog "Some example scripts provided by ${PV} require dev-lang/ruby"
	elog "or dev-lang/python to be installed."
	echo
}
