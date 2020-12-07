# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=k4dirstat
inherit xdg cmake

DESCRIPTION="Graphically displays disk space used up by a directory tree"
HOMEPAGE="https://github.com/jeromerobert/k4dirstat"
SRC_URI="https://github.com/jeromerobert/${MY_PN}/archive/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${MY_PN}-${PV}"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	dev-qt/qt3support:4
	dev-qt/qtcore:4[qt3support]
	dev-qt/qtgui:4[qt3support]
	kde-apps/libkonq:4
	kde-frameworks/kdelibs[qt3support]
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=( -DK4DIRSTAT_GIT_VERSION=OFF )
	cmake_src_configure
}
