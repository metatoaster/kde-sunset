# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit kde

DESCRIPTION="Grid of Konsole terminals"
HOMEPAGE="http://nomis80.org/quadkonsole/"
SRC_URI="http://nomis80.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=kde-apps/konsole-3.5*"
DEPEND="${RDEPEND}"

need-kde 3.3

src_install() {
	kde_src_install

	rm -rf "${D}/usr/share/applnk"
	insinto /usr/share/applications
	doins "${S}/src/${PN}.desktop"
}
