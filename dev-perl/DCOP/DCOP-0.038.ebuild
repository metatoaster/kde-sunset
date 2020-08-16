# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="Extensible inheritable Perl class to dcop."
HOMEPAGE="http://www.cpan.org/modules/by-authors/id/J/JC/JCMULLER/${P}.readme"
SRC_URI="mirror://cpan/authors/id/J/JC/JCMULLER/${P}.tar.gz"

RDEPEND="kde-frameworks/kdelibs:3.5"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

SRC_TEST="do"
