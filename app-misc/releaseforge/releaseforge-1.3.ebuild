# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="GUI utility for making software releases on SourceForge"
HOMEPAGE="http://releaseforge.sourceforge.net/"
SRC_URI="mirror://sourceforge/releaseforge/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.3
	>=dev-python/PyQt-3.0.0
	dev-python/paramiko"
RDEPEND="${DEPEND}"
