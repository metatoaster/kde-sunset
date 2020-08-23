# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-irc/konversation/konversation-1.1-r1.ebuild,v 1.6 2009/05/31 14:53:16 ranger Exp $

EAPI="2"

ARTS_REQUIRED="never"

USE_KEG_PACKAGING=1

inherit kde

MY_P="${P/_/}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="User friendly IRC Client for KDE 3.x"
HOMEPAGE="https://konversation.kde.org/"
SRC_URI="mirror://sourceforge/${PN}.berlios/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="amd64 ppc ppc64 ~sparc x86"
IUSE=""

DEPEND="!<net-irc/konversation-1.1-r1"
RDEPEND="${DEPEND}"

need-kde 3.5

LANGS="ar bg ca da de el es et fi fr gl he hu it ja ka ko pa pt ru sr sv tr zh_CN zn_TW"
LANGS_DOC="da es et it pt ru sv"

pkg_postinst() {
	kde_pkg_postinst

	if ! has_version kde-apps/konsole; then
		elog "If you want to be able to use Konsole from inside ${PN}, please emerge"
		elog "kde-apps/konsole:3.5"
	fi
}
