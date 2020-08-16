# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="JCMULLER"
inherit perl-module

DESCRIPTION="Perl interface to Amarok via dcop"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

#Tests disabled - comment back if you are testing and are running an active KDE
# session
# ~mcummings
#SRC_TEST="do"

RDEPEND="dev-perl/DCOP-Amarok"
