# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="The fdi scripts that HAL uses"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/hal/"
SRC_URI="https://hal.freedesktop.org/releases/${P}.tar.gz
	mirror://kde-sunset/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~hppa ~mips ppc ppc64 ~sparc x86"
IUSE=""

RDEPEND=">=sys-apps/hal-0.5.10"
DEPEND="${RDEPEND}"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

src_install() {
	emake DESTDIR="${D}" install || die
}
