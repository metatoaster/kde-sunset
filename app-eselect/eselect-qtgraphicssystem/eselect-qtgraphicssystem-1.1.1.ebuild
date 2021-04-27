# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Utility to change the active Qt Graphics System"
HOMEPAGE="https://github.com/gentoo/eselect-qtgraphicssystem"
SRC_URI="https://github.com/gentoo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=app-admin/eselect-1.2.4"

src_install() {
	insinto /usr/share/eselect/modules
	doins qtgraphicssystem.eselect
}
