# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="Quake-style terminal emulator based on konsole"
HOMEPAGE="https://kde.org/applications/en/system/org.kde.yakuake"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2 LGPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="
	|| ( $(add_kdeapps_dep konsolepart) $(add_kdeapps_dep konsole) )
	x11-libs/libX11
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

DOCS=( AUTHORS ChangeLog KDE4FAQ NEWS README TODO )

PATCHES=( "${FILESDIR}/${P}-lastsession.patch" )
