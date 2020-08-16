# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="Perl Interface to Amarok via system's dcop"
HOMEPAGE="http://search.cpan.org/~jcmuller/"
SRC_URI="mirror://cpan/authors/id/J/JC/JCMULLER/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

SRC_TEST="do"

RDEPEND="
	dev-perl/DCOP
	media-sound/amarok:3.5
"
