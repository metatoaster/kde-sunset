# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-app

DESCRIPTION="a simple graphical frontend for playing DVDs with MPlayer, using Perl and Qt."
HOMEPAGE="http://asdf-mplayer.sourceforge.net"
SRC_URI="mirror://sourceforge/asdf-mplayer/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	=dev-perl/PerlQt-3*
	>=media-video/lsdvd-0.15
	media-video/mplayer"

mydoc="BUGS+HACKING CREDITS TODO"

src_configure() {
	perl-app_src_configure
}
