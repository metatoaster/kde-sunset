# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kbounce/kbounce-3.5.10.ebuild,v 1.7 2009/07/12 11:44:17 armin76 Exp $

EAPI="1"
KMNAME=kdegames
inherit kde-meta

DESCRIPTION="KDE Bounce Ball Game"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86"
IUSE="kdehiddenvisibility"
DEPEND=">=kde-apps/libkdegames-${PV}:${SLOT}"

RDEPEND="${DEPEND}"

KMEXTRACTONLY=libkdegames
KMCOPYLIB="libkdegames libkdegames"
