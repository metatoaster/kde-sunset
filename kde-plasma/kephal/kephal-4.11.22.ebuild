# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-workspace"
KMMODULE="libs/kephal"
inherit kde4-meta

DESCRIPTION="Allows handling of multihead systems via the XRandR extension"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"

KMEXTRACTONLY+="
	kephal/kephal/screens.h
"

PATCHES=(
	"${FILESDIR}/${P}-gcc6.patch"
)
