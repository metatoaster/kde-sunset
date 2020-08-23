# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=1
ARTS_REQUIRED="never"
inherit kde

DESCRIPTION="KDE front-end to Cscope"
HOMEPAGE="https://sourceforge.net/projects/kscope/"
SRC_URI="mirror://sourceforge/kscope/${P}.tar.gz"

LICENSE="BSD"
SLOT="3.5"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""

RDEPEND="
	>=dev-util/cscope-15.5-r4
	dev-util/ctags
	kde-apps/kate:3.5
	media-gfx/graphviz"
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

need-kde 3.5

PATCHES=( "${FILESDIR}/${PN}-1.6.1-desktop-entry.diff" )

src_unpack() {
	kde_src_unpack
	rm -f "${S}"/configure
}

src_install() {
	kde_src_install

	insinto /usr/share/config
	doins "${FILESDIR}"/${PN}rc
}
