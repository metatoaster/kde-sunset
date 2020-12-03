# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

COMMIT=562da6111ab1ea817360c20b6a54e918817c31bf
KDEBASE="kdevelop"
KMNAME="kdev-qmake"
inherit kde4-base

DESCRIPTION="qmake plugin for KDevelop 4"
SRC_URI="https://invent.kde.org/unmaintained/${KMNAME}/-/archive/${COMMIT}/${KMNAME}-${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${KMNAME}-${COMMIT}"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="debug tools"

DEPEND="
	dev-util/kdevelop:4
	dev-util/kdevelop-pg-qt:4
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build tools qmake_parser)
	)
	kde4-base_src_configure
}

src_install() {
	kde4-base_src_install
	#Move this file to prevent a collision with kappwizard
	mv "${D}"/usr/share/apps/kdevappwizard/templates/qmake_qt4guiapp.tar.bz2 \
		"${D}"/usr/share/apps/kdevappwizard/templates/kdevelop-qmake_qt4guiapp.tar.bz2 \
		|| die
}
