# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="A set of different KDE Plasma styles"
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	kde-plasma/liboxygenstyle:4=
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	libs/oxygen
"
