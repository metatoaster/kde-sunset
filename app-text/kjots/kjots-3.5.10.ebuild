# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

KDE_MINIMAL="${PV}"
KDEBASE=true
KMNAME=kdeutils
inherit kde-meta eutils

DESCRIPTION="Note taking utility by KDE"
SRC_URI="mirror://kde/Attic/stable/${PV}/src/${KMNAME}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE="debug kdehiddenvisibility"
