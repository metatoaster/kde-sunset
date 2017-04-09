# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE Wallet Management Tool"
HOMEAGE="https://www.kde.org/applications/system/kwalletmanager
https://utils.kde.org/projects/kwalletmanager"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND=""
RDEPEND="
	!kde-base/kwallet:4
	|| ( >=kde-base/legacy-icons-4.11.22-r1 kde-apps/kwalletmanager:5 )
"

src_install() {
	kde4-base_src_install
	rm -r "${ED}"usr/share/icons  || die
}
