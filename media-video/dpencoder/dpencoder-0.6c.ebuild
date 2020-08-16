# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="A PerlQt frontend to rip DVDs"
HOMEPAGE="http://dpencoder.sourceforge.net/"
SRC_URI="mirror://sourceforge/dpencoder/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~sparc ~x86"
IUSE=""

S=${WORKDIR}/${P}/DPencoder

DEPEND="
	dev-lang/perl
	dev-perl/PerlQt
	media-libs/libdvdread
	>=media-video/mplayer-1.0_pre1
	virtual/perl-DB_File
"

src_compile() {
	perl-module_src_compile
}

src_install() {
	perl-module_src_install
	dodoc README
}
