# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
KMNAME="kdewebdev"
inherit kde4-meta

DESCRIPTION="KDE web development - link validity checker"
HOMEPAGE="https://apps.kde.org/en/klinkstatus"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug tidy"

DEPEND="
	$(add_kdeapps_dep kdepimlibs)
	tidy? ( app-text/tidy-html5 )
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-tidyhtml5.patch" )

src_configure() {
	local mycmakeargs=(
		-DWITH_KdepimLibs=ON
		-DWITH_LibTidy=$(usex tidy)
	)

	kde4-meta_src_configure
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	has_version dev-lang/ruby ||
		elog "To use scripting in ${PN}, install dev-lang/ruby."
}
