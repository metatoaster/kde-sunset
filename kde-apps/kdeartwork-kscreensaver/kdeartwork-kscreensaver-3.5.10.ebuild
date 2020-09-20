# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

KMMODULE=kscreensaver
KMNAME=kdeartwork
inherit kde-meta

DESCRIPTION="Extra screensavers for kde"
KEYWORDS="~alpha amd64 ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE="opengl xscreensaver"
DEPEND="|| (
		>=kde-plasma/kscreensaver-${PV}:${SLOT}
		>=kde-base/kdebase-${PV}:${SLOT}
	)
	media-libs/libart_lgpl
	opengl? ( virtual/opengl )
	xscreensaver? ( x11-misc/xscreensaver )"

src_compile() {
	local myconf="$myconf --with-dpms --with-libart
				$(use_with opengl gl) $(use_with xscreensaver)"

	kde-meta_src_compile
}
