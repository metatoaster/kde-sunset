# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit kde

DESCRIPTION="Network interface monitor panel applet"
HOMEPAGE="http://pan4os.info"
SRC_URI="http://pan4os.info/apps/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

need-kde 3.5
