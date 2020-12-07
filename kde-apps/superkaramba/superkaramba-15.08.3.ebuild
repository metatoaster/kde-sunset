# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde4-base

DESCRIPTION="A tool to create interactive applets for the KDE desktop"
HOMEPAGE="https://techbase.kde.org/Projects/SuperKaramba/FAQ"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	media-libs/qimageblitz
	x11-libs/libX11
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=( -DWITH_PythonLibs=OFF )
	kde4-base_src_configure
}
