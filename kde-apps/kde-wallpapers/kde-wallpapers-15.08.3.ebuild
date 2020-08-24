# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-wallpapers"
inherit kde4-base

DESCRIPTION="KDE wallpapers"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="+minimal"

src_configure() {
	local mycmakeargs=( -DWALLPAPER_INSTALL_DIR="${EPREFIX}/usr/share/wallpapers" )

	kde4-base_src_configure
}

src_install() {
	kde4-base_src_install

	if use minimal ; then
		rm -r "${ED}"usr/share/wallpapers/Autumn || die
	fi
}
