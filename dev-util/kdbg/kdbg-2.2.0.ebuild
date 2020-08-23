# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

ARTS_REQUIRED="never"
inherit eutils kde

DESCRIPTION="Graphical debugger interface"
HOMEPAGE="https://www.kdbg.org/"
SRC_URI="mirror://sourceforge/kdbg/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=">=sys-devel/gdb-5.0"

need-kde 3.5

src_unpack() {
	kde_src_unpack
	epatch "${FILESDIR}"/${P}-glibc-2.10.patch
}
