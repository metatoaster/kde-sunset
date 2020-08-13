# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/atlantikdesigner/atlantikdesigner-3.5.10.ebuild,v 1.7 2009/07/12 12:23:29 armin76 Exp $
EAPI="1"
KMNAME=kdeaddons
inherit kde-meta

DESCRIPTION="Atlantik gameboard designer"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE=""
DEPEND=">=kde-base/atlantik-${PV}:${SLOT}"
