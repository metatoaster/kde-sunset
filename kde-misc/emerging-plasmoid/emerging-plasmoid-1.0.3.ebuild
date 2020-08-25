# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="Portage emerge progress plasmoid"
HOMEPAGE="https://www.linux-apps.com/p/999027"
SRC_URI="https://github.com/downloads/leonardo2d/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="4"
IUSE="debug"

DEPEND="
	dev-lang/perl
	dev-perl/Date-Manip
"
RDEPEND="${DEPEND}
	kde-plasma/plasma-workspace:4
"
