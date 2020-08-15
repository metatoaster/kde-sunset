# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/korn/korn-3.5.10.ebuild,v 1.7 2009/07/12 13:04:03 armin76 Exp $

EAPI="1"
KMNAME=kdepim
inherit kde-meta eutils

DESCRIPTION="KDE mailbox checker"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE=""

DEPEND=">=kde-base/mimelib-${PV}:${SLOT}
>=kde-base/libkmime-${PV}:${SLOT}"
RDEPEND="${DEPEND}
	|| ( >=kde-apps/kdebase-kioslaves-${PV}:${SLOT} >=kde-frameworks/kdelibs-${PV}:${SLOT} )
	>=kde-base/kdepim-kioslaves-${PV}:${SLOT}"

KMCOPYLIB="libmimelib mimelib
	libkmime libkmime"
# libkcal is installed because a lot of headers are needed, but it doesn't have to be compiled
KMEXTRACTONLY="
	mimelib/
	libkmime/
	libkdenetwork/"
