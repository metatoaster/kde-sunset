# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-workspace"
KMMODULE="libs/oxygen"
inherit kde4-meta

DESCRIPTION="Library to support the Oxygen style in KDE Plasma"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"
SLOT="4/${PV}"

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-gcc6.patch"
)
