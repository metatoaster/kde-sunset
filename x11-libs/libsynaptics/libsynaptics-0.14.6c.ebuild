# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Library for accessing synaptics touchpads"
HOMEPAGE="http://qsynaptics.sourceforge.net/"
SRC_URI="http://qsynaptics.sourceforge.net/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=x11-drivers/xf86-input-synaptics-0.15.0"

PATCHES=( "${FILESDIR}/libsynaptics-0.14.6c-add-missing-includes.patch" )

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
}
