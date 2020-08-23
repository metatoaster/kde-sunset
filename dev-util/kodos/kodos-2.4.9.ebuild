# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit distutils eutils

DESCRIPTION="Python GUI utility for creating, testing and debugging regular expressions"
HOMEPAGE="http://kodos.sourceforge.net/"
SRC_URI="mirror://sourceforge/kodos/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=">dev-python/PyQt-3.8.1"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
	cd "${D}"/usr/bin
	dosym kodos.py /usr/bin/kodos
}
