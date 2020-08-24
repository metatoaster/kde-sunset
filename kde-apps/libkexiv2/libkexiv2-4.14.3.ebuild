# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="KDE Image Plugin Interface: an exiv2 library wrapper"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug +xmp"

DEPEND="
	>=media-gfx/exiv2-0.27:=[xmp=]
	virtual/jpeg:0
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/exiv-0.27.patch" )
