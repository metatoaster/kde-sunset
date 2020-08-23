# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

MY_PN="${PN}${SLOT}"
MY_P="${MY_PN}-${PV}"
inherit eutils

DESCRIPTION="Kita - 2ch client for KDE"
HOMEPAGE="http://kita.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/kita/33012/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="
	kde-base/korundum
	kde-base/qtruby
"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gems.patch"
}

src_install() {
	local mydir=/usr/share/${MY_PN}
	exeinto ${mydir}
	doexe *.rb
	insinto  ${mydir}
	doins *.kdevelop *.png *.ui

	newicon kita.png ${MY_PN}.png
	domenu "${FILESDIR}/${MY_PN}.desktop"

	dodoc README.ja
	make_wrapper ${MY_PN} ./kita.rb ${mydir}
}
