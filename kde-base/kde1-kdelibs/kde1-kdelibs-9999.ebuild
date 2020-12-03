# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="KDE libraries, adapted to compile on modern systems (circa. 2016)"
HOMEPAGE="https://invent.kde.org/historical/kde1-kdelibs"
EGIT_REPO_URI="https://invent.kde.org/historical/kde1-kdelibs.git"

LICENSE="GPL-2+ LGPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="+debug"

DEPEND="
	dev-qt/qt1
	media-libs/libpng:0=
	media-libs/tiff:0
	virtual/jpeg:0
	x11-libs/libX11
	x11-libs/libXext
"
RDEPEND="${DEPEND}"
