# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_P="${P/_/-}"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="Advanced twin-panel (commander-style) file-manager with many extras"
HOMEPAGE="https://krusader.org/"
SRC_URI="mirror://sourceforge/krusader/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="+bookmarks debug"

COMMON_DEPEND="
	$(add_kdeapps_dep libkonq)
	sys-libs/zlib
	bookmarks? ( $(add_kdeapps_dep keditbookmarks) )
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kdebase-kioslaves)
"
DEPEND="${COMMON_DEPEND}
	sys-devel/gettext
"

PATCHES=( "${FILESDIR}/${P}-new-folder.patch" )

S="${WORKDIR}/${MY_P}"
