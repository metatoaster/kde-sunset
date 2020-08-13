# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kde-meta/kde-meta-3.5.10.ebuild,v 1.7 2009/07/12 13:48:34 armin76 Exp $

EAPI="1"
inherit kde-functions
DESCRIPTION="kde - merge this to pull in all kde packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~alpha amd64 hppa ~ia64 ~mips ppc ppc64 sparc x86"
IUSE="accessibility nls"

RDEPEND="~kde-frameworks/kdelibs-${PV}
>=kde-base/kdeaddons-meta-${PV}:${SLOT}
>=kde-apps/kdeadmin-meta-${PV}:${SLOT}
>=kde-base/kdebase-meta-${PV}:${SLOT}
>=kde-base/kdeedu-meta-${PV}:${SLOT}
>=kde-base/kdegames-meta-${PV}:${SLOT}
>=kde-base/kdegraphics-meta-${PV}:${SLOT}
>=kde-apps/kdemultimedia-meta-${PV}:${SLOT}
>=kde-apps/kdenetwork-meta-${PV}:${SLOT}
>=kde-apps/kdepim-meta-${PV}:${SLOT}
>=kde-apps/kdetoys-meta-${PV}:${SLOT}
>=kde-apps/kdeutils-meta-${PV}:${SLOT}
>=kde-apps/kdeartwork-meta-${PV}:${SLOT}
>=kde-apps/kdewebdev-meta-${PV}:${SLOT}
accessibility? ( >=kde-apps/kdeaccessibility-meta-${PV}:${SLOT} )
nls? ( >=kde-base/kde-i18n-${PV}:${SLOT} )
!kde-base/kde:3.5"
