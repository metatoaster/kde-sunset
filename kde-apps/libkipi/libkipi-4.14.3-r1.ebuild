# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit kde4-base

DESCRIPTION="A library for image plugins accross KDE applications"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND=""
RDEPEND="|| ( >=kde-base/legacy-icons-4.11.22-r1 kde-apps/libkipi:5 )"

src_install() {
	kde4-base_src_install
	rm -r "${ED}"usr/share/icons || die
}
