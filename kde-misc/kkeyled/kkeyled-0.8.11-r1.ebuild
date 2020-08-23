# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

ARTS_REQUIRED="never"
inherit kde

DESCRIPTION="Kicker module showing the status of your keyboard's numlock, capslock and scrolllock"
HOMEPAGE="http://www.truesoft.ch/dieter/kkeyled.html"
SRC_URI="http://www.truesoft.ch/dieter/kkeyled/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

need-kde 3.5

src_unpack() {
	kde_src_unpack
	rm "${S}"/configure
}
