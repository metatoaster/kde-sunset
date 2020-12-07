# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils

DESCRIPTION="Fast hex-editor with support for large files and comparing binary files"
HOMEPAGE="http://freshmeat.sourceforge.net/projects/lfhex/
https://github.com/srtlg/lfhex"
SRC_URI="https://github.com/srtlg/${PN}/archive/v${PV}.tar.gz -> ${P}a.tar.gz"
S="${WORKDIR}/${P}/src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DOCS=( ../README )

RDEPEND="
	dev-qt/qtgui:4
	x11-libs/libXt
"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-devel/bison
	sys-devel/flex
"

PATCHES=(
	# Apply Debian patches to fix compilation errors like gcc-4.7 compat
	"${FILESDIR}"/01-abs-llabs.dpatch
	"${FILESDIR}"/02-gcc-4.7.dpatch
)

src_configure() {
	eqmake4
}

src_install() {
	dobin lfhex
	einstalldocs
	make_desktop_entry "${PN}" "${PN}"
}
