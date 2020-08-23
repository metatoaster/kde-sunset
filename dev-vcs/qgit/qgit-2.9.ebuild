# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit eutils qt4-r2

DESCRIPTION="Qt4 GUI for git repositories"
HOMEPAGE="https://github.com/tibirna/qgit"
SRC_URI="https://github.com/tibirna/${PN}/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND="dev-qt/qtgui:4"
RDEPEND="${DEPEND}
	>=dev-vcs/git-1.6
"

S="${WORKDIR}"/${PN}-${P}

src_install() {
	newbin bin/qgit qgit4
	newicon src/resources/qgit.png qgit4.png
	make_desktop_entry qgit4 QGit qgit4
	dodoc README
}
