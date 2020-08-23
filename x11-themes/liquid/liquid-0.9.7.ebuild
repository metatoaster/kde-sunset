# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

ARTS_REQUIRED="never"
inherit kde

DESCRIPTION="Liquid theme, revamped for KDE 3.2"
HOMEPAGE="https://sourceforge.net/projects/liquid.berlios/"
SRC_URI="mirror://sourceforge/${PN}.berlios/${P}.tar.bz2
		mirror://gentoo/kde-admindir-3.5.3.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="kde-base/kwin:3.5"

need-kde 3.2
