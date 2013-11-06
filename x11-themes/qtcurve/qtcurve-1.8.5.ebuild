# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/qtcurve/qtcurve-0.69.1.ebuild,v 1.4 2009/11/08 19:31:13 nixnut Exp $

EAPI=5

# Order is important, so we get src_compile from cmake-utils.
inherit kde-functions qt3 cmake-utils

MY_P=${P/qtcurve/QtCurve-KDE3}

DESCRIPTION="A set of widget styles for KDE3 based apps, also available for GTK2 and Qt4"
HOMEPAGE="http://www.kde-look.org/content/show.php?content=40492"
SRC_URI="http://craigd.wikispaces.com/file/view/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="dev-qt/qt-meta:3"
DEPEND="${RDEPEND}"

need-kde 3.5

S=${WORKDIR}/${MY_P}
DOCS="ChangeLog README TODO"

src_configure() {
	local mycmakeargs
	mycmakeargs=(
		-DQT_PLUGINS_DIR=/usr/qt/3/plugins
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	buildsycoca
}

pkg_postrm() {
	buildsycoca
}
