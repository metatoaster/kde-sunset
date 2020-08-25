# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

KDE_MINIMAL="${PV}"
KDEBASE=true
KMNAME=kdeedu
inherit kde-meta

DESCRIPTION="KDE Desktop Planetarium"
HOMEPAGE="https://kde.org/applications/en/education/org.kde.kstars https://edu.kde.org/kstars"
SRC_URI="mirror://kde/Attic/stable/${PV}/src/${KMNAME}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE="debug"

DEPEND=">=kde-apps/libkdeedu-${PV}:${SLOT}"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="libkdeedu/extdate
	libkdeedu/kdeeduplot
	libkdeedu/kdeeduui"
KMCOPYLIB="libextdate libkdeedu/extdate
	libkdeeduplot libkdeedu/kdeeduplot
	libkdeeduui libkdeedu/kdeeduui"

src_unpack() {
	kde-meta_src_unpack
	cd "${S}"
}
