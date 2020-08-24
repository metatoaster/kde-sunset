# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
OPENGL_REQUIRED="always"
inherit kde4-base kde4-functions-extra

DESCRIPTION="KDE image viewer"
HOMEPAGE="
	https://www.kde.org/applications/graphics/gwenview/
	https://userbase.kde.org/Gwenview
"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug kipi"

# tests fail, last checked 4.11.0
RESTRICT="test"

DEPEND="
	$(add_kdeapps_dep libkdcraw)
	$(add_kdeapps_dep libkonq)
	>=media-gfx/exiv2-0.27
	media-libs/lcms:2
	media-libs/libpng:0=
	virtual/jpeg:0
	x11-libs/libX11
	kipi? ( $(add_kdeapps_dep libkipi) )
"

PATCHES=(
	"${FILESDIR}/${PN}-exiv2-0.27.patch"
	"${FILESDIR}/${PN}-exiv2-0.27.1.patch"
)

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with kipi)
	)
	# Workaround for bug #479510
	if [[ -e ${EPREFIX}/usr/include/${CHOST}/jconfig.h ]]; then
		mycmakeargs+=( -DJCONFIG_H="${EPREFIX}/usr/include/${CHOST}/jconfig.h" )
	fi

	mycmakeargs+=(-DGWENVIEW_SEMANTICINFO_BACKEND=None)

	append-cppflags -fexceptions

	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	if ! has_version kde-apps/svgpart:${SLOT} ; then
		elog "For SVG support, install kde-apps/svgpart:${SLOT}"
	fi

	if use kipi && ! has_version kde-apps/kipi-plugins ; then
		elog "The plugins for the KIPI inteface can be found in kde-apps/kipi-plugins"
	fi
}
