# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit qt3 eutils

DESCRIPTION="Desktop Publishing (DTP) and Layout program for Linux."
HOMEPAGE="http://www.scribus.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="dev-qt/qt-meta:3
	>=media-libs/freetype-2.1
	>=media-libs/lcms-1.09
	media-libs/tiff
	>=media-libs/libart_lgpl-2.3.8
	>=dev-libs/libxml2-2.6.0
	>=x11-libs/cairo-1.4.0[X,svg]"

RDEPEND="${DEPEND}
	app-text/ghostscript-gpl"

DOCS=( AUTHORS ChangeLog README TODO )

src_configure() {
	econf --enable-cairo || die
}

src_install() {
	default

	domenu scribus.desktop
	doicon scribus/icons/scribusicon.png
}
