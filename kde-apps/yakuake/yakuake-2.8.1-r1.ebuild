# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

KDEBASE=false
USE_KEG_PACKAGING=1
LANGS="de el es et fr hu it ja nl pl pt_BR pt sv tr"
inherit kde

DESCRIPTION="Quake-style terminal emulator based on konsole"
HOMEPAGE="https://kde.org/applications/en/system/org.kde.yakuake"
SRC_URI="mirror://kde/Attic/${PN}/${PV}/src/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="kde-apps/konsole:3.5"
RDEPEND="${DEPEND}
	!kde-misc/yakuake:0
"

need-kde 3.5
