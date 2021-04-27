# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="Library for mapping JSON data to QVariant objects"
HOMEPAGE="http://qjson.sourceforge.net/"
SRC_URI="https://github.com/flavio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa ~ppc ~ppc64 x86"
IUSE="debug doc test"

RESTRICT+=" !test? ( test )"

RDEPEND="
	dev-qt/qtcore:4[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	test? ( dev-qt/qttest:4[${MULTILIB_USEDEP}] )
"

DOCS=( ChangeLog README.md )

PATCHES=(
	"${FILESDIR}/${P}-gnuinstalldirs.patch"
	"${FILESDIR}/${P}-featuresummary.patch"
)

multilib_src_configure() {
	local mycmakeargs=(
		-DQT4_BUILD=ON
		-DQJSON_BUILD_TESTS=$(usex test)
	)

	cmake_src_configure
}

multilib_src_install_all() {
	if use doc && is_final_abi; then
		pushd doc > /dev/null || die
			doxygen Doxyfile || die "Generating documentation failed"
			local HTML_DOCS=( doc/html/. )
		popd > /dev/null || die
		einstalldocs
	fi
}
