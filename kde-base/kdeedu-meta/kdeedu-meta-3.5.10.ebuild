# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdeedu-meta/kdeedu-meta-3.5.10.ebuild,v 1.7 2009/07/12 12:25:53 armin76 Exp $

EAPI="1"
inherit kde-functions
DESCRIPTION="kdeedu - merge this to pull in all kdeedu-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE=""

RDEPEND="
>=kde-apps/blinken-${PV}:${SLOT}
>=kde-apps/kanagram-${PV}:${SLOT}
>=kde-apps/kalzium-${PV}:${SLOT}
>=kde-apps/kgeography-${PV}:${SLOT}
>=kde-apps/khangman-${PV}:${SLOT}
>=kde-apps/kig-${PV}:${SLOT}
>=kde-base/kpercentage-${PV}:${SLOT}
>=kde-apps/kiten-${PV}:${SLOT}
>=kde-base/kvoctrain-${PV}:${SLOT}
>=kde-apps/kturtle-${PV}:${SLOT}
>=kde-base/kverbos-${PV}:${SLOT}
>=kde-base/kdeedu-applnk-${PV}:${SLOT}
>=kde-apps/kbruch-${PV}:${SLOT}
>=kde-base/keduca-${PV}:${SLOT}
>=kde-base/klatin-${PV}:${SLOT}
>=kde-apps/kmplot-${PV}:${SLOT}
>=kde-apps/kstars-${PV}:${SLOT}
>=kde-apps/ktouch-${PV}:${SLOT}
>=kde-apps/klettres-${PV}:${SLOT}
>=kde-apps/kwordquiz-${PV}:${SLOT}
"
