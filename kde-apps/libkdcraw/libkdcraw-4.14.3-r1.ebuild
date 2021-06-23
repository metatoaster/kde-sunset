# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="KDE digital camera raw image library wrapper"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	<=media-libs/libraw-0.18.13:=
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-libraw-0.16.1.patch" )
