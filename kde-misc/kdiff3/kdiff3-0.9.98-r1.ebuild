# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Qt/KDE based frontend to diff3"
HOMEPAGE="https://apps.kde.org/en/kdiff3"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86 ~amd64-linux"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}
	sys-apps/diffutils
"

RESTRICT="test"

src_prepare() {
	default
	# adapt to Gentoo paths
	sed -e s,documentation.path.*$,documentation.path\ =\ "${EPREFIX}"/usr/share/doc/"${PF}", \
		-e s,target.path.*$,target.path\ =\ "${EPREFIX}"/usr/bin, -i src-QT4/kdiff3.pro || die
}

src_configure() {
	eqmake4 src-QT4/kdiff3.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
