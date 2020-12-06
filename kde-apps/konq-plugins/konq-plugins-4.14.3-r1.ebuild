# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KMNAME="kde-baseapps"
inherit kde4-meta

DESCRIPTION="Various plugins for konqueror"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug tidy"

DEPEND="
	$(add_kdeapps_dep libkonq)
	tidy? ( app-text/tidy-html5 )
"
RDEPEND="${DEPEND}
	!kde-misc/konq-plugins
	$(add_kdeapps_dep kcmshell)
	$(add_kdeapps_dep konqueror)
"

PATCHES=( "${FILESDIR}/${P}-tidyhtml5.patch" ) # bug 671450

src_configure() {
	local mycmakeargs=(
		-DWITH_LibTidy=$(usex tidy)
	)

	kde4-meta_src_configure
}
