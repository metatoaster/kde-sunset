# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/klinkstatus/klinkstatus-3.5.10.ebuild,v 1.7 2009/07/12 10:35:09 armin76 Exp $
EAPI="1"
KMNAME=kdewebdev
inherit kde-meta

DESCRIPTION="KDE link status checker for html pages"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~ppc64 ~sparc ~x86"
IUSE="kdehiddenvisibility"
DEPEND=""

PATCHES=( "${FILESDIR}/${KMNAME}_${PN}-r854465.patch" )
