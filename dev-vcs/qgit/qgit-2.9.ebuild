# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg

DESCRIPTION="Qt GUI for git repositories"
HOMEPAGE="https://github.com/tibirna/qgit"
SRC_URI="https://github.com/tibirna/qgit/archive/${P}.tar.gz
https://raw.githubusercontent.com/tibirna/${PN}/fb47a8006bb9342e46dadb2883ba8eda86642ee1/src/resources/tab_remove.png -> ${PN}-tab_remove.png"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}
	dev-vcs/git
"

S="${WORKDIR}/${PN}-${P}"

DOCS=( README.adoc )

PATCHES=( "${FILESDIR}"/${P}-fix-qt4-build-{1,2}.patch )

src_prepare() {
	cmake_src_prepare
	mv "${DISTDIR}"/${PN}-tab_remove.png src/resources/tab_remove.png || die
}

src_configure() {
	local mycmakeargs=( -DUseQt5=OFF )
	cmake_src_configure
}
