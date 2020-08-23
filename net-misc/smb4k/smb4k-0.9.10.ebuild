# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

ARTS_REQUIRED="never"
inherit kde

DESCRIPTION="Advanced network neighborhood browser"
HOMEPAGE="https://kde.org/applications/utilities/org.kde.smb4k
https://sourceforge.net/p/smb4k/home/Home/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND="kde-apps/konqueror:3.5"
RDEPEND="${DEPEND}
	net-fs/samba"

need-kde 3.5
