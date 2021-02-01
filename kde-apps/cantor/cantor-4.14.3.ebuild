# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE4 interface for doing mathematics and scientific computing"
HOMEPAGE="https://apps.kde.org/en/cantor https://edu.kde.org/cantor"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="analitza debug postscript qalculate +R"

# TODO Add Sage Mathematics Software backend (http://www.sagemath.org)
RDEPEND="
	dev-qt/qtxmlpatterns:4
	analitza? ( $(add_kdeapps_dep analitza) )
	qalculate? (
		sci-libs/cln
		sci-libs/libqalculate
	)
	postscript? ( app-text/libspectre )
	R? ( dev-lang/R )
"
DEPEND="${RDEPEND}
	>=dev-cpp/eigen-2.0.3:2
"

RESTRICT="test"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with analitza)
		$(cmake-utils_use_with postscript LibSpectre)
		-DWITH_PythonLibs=OFF
		$(cmake-utils_use_with qalculate)
		$(cmake-utils_use_with R)
	)
	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	if ! use analitza && ! use qalculate && ! use R; then
		echo
		ewarn "You have decided to build ${PN} with no backend."
		ewarn "To have this application functional, please do one of below:"
		ewarn "    # emerge -va1 '='${CATEGORY}/${P} with 'analitza', 'qalculate' or 'R' USE flag enabled"
		ewarn "    # emerge -vaDu sci-mathematics/maxima"
		echo
	fi
}
