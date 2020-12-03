# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="KDE 1 base applications, adapted to compile on modern systems (circa. 2016)"
HOMEPAGE="https://invent.kde.org/historical/kde1-kdebase"
EGIT_REPO_URI="https://invent.kde.org/historical/kde1-kdebase.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qt1
	kde-base/kde1-kdelibs
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_compile() {
	pushd "${BUILD_DIR}"
	# don't ask
	nonfatal emake
	emake
}
