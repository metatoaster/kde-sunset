# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK=optional
KDE_LINGUAS_DIR="i18n"
inherit kde4-base

MY_P=${PN}4-${PV}

DESCRIPTION="Grid of Konsole terminals"
HOMEPAGE="https://www.linux-apps.com/p/1127778"
SRC_URI="http://ponce.cc/slackware/sources/repo/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="
	|| ( $(add_kdeapps_dep konsolepart) $(add_kdeapps_dep konsole) )
	$(add_kdeapps_dep libkonq)
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog )

S=${WORKDIR}/${MY_P}
