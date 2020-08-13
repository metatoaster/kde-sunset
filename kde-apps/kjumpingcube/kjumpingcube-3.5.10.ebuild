# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kjumpingcube/kjumpingcube-3.5.10.ebuild,v 1.7 2009/07/12 11:53:00 armin76 Exp $
EAPI="1"
KMNAME=kdegames
inherit kde-meta

DESCRIPTION="KDE: Tactical one or two player game"
KEYWORDS="~alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86"
IUSE="kdehiddenvisibility"

DEPEND=">=kde-base/appsdegames-${PV}:${SLOT}"
RDEPEND="${DEPEND}"

KMEXTRACTONLY=libkdegames
KMCOPYLIB="libkdegames libkdegames"
