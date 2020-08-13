# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/dcoprss/dcoprss-3.5.10.ebuild,v 1.7 2009/07/12 11:38:45 armin76 Exp $

EAPI="1"
KMNAME=kdenetwork
inherit kde-meta eutils

DESCRIPTION="KDE: RSS server and client for DCOP"
KEYWORDS="~alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86"
IUSE="kdehiddenvisibility"
DEPEND=">=kde-base/librss-${PV}:${SLOT}"

KMCOPYLIB="librss librss"
KMEXTRACTONLY="librss"
