# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdegames-meta/kdegames-meta-3.5.10.ebuild,v 1.7 2009/07/12 12:26:48 armin76 Exp $

EAPI="1"
inherit kde-functions
DESCRIPTION="kdegames - merge this to pull in all kdegames-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="arts"

RDEPEND="
arts? ( >=kde-base/kasteroids-${PV}:${SLOT}
	>=kde-base/kolf-${PV}:${SLOT} )
>=kde-base/atlantik-${PV}:${SLOT}
>=kde-apps/katomic-${PV}:${SLOT}
>=kde-base/kbackgammon-${PV}:${SLOT}
>=kde-base/kbattleship-${PV}:${SLOT}
>=kde-apps/kblackbox-${PV}:${SLOT}
>=kde-apps/kbounce-${PV}:${SLOT}
>=kde-base/kenolaba-${PV}:${SLOT}
>=kde-base/kfouleggs-${PV}:${SLOT}
>=kde-apps/kgoldrunner-${PV}:${SLOT}
>=kde-apps/kjumpingcube-${PV}:${SLOT}
>=kde-apps/klickety-${PV}:${SLOT}
>=kde-apps/klines-${PV}:${SLOT}
>=kde-apps/kmahjongg-${PV}:${SLOT}
>=kde-apps/kmines-${PV}:${SLOT}
>=kde-apps/knetwalk-${PV}:${SLOT}
>=kde-apps/konquest-${PV}:${SLOT}
>=kde-apps/kpat-${PV}:${SLOT}
>=kde-base/kpoker-${PV}:${SLOT}
>=kde-base/ktron-${PV}:${SLOT}
>=kde-apps/ktuberling-${PV}:${SLOT}
>=kde-base/ksame-${PV}:${SLOT}
>=kde-apps/kshisen-${PV}:${SLOT}
>=kde-base/ksirtet-${PV}:${SLOT}
>=kde-base/ksmiletris-${PV}:${SLOT}
>=kde-base/ksnake-${PV}:${SLOT}
>=kde-base/ksokoban-${PV}:${SLOT}
>=kde-apps/kspaceduel-${PV}:${SLOT}
>=kde-apps/kreversi-${PV}:${SLOT}
>=kde-base/kwin4-${PV}:${SLOT}
>=kde-apps/lskat-${PV}:${SLOT}
"
