# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

COMMIT=2269c30f4e75c4490af8cd91e512e7ffbb4c8729
VIRTUALX_REQUIRED="test"
DECLARATIVE_REQUIRED="always"
inherit kde4-base

DESCRIPTION="Plasma screen management"
HOMEPAGE="https://invent.kde.org/plasma/kscreen"
SRC_URI="https://github.com/KDE/kscreen/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

RDEPEND="
	>=dev-libs/qjson-0.8
	>=kde-plasma/libkscreen-1.0.4:4
"
DEPEND="${RDEPEND}
	sys-devel/gettext"

DISPLAY_MESSAGE=false

S="${WORKDIR}/${PN}-${COMMIT}"

pkg_preinst() {
	if ! has_version ${CATEGORY}/${PN} ; then
		DISPLAY_MESSAGE=true
	fi

	kde4-base_pkg_preinst
}

pkg_postinst() {
	if [[ "${DISPLAY_MESSAGE}" = true ]]; then
		echo
		elog "Disable the old screen management:"
		elog "# qdbus org.kde.kded /kded org.kde.kded.unloadModule randrmonitor"
		elog "# qdbus org.kde.kded /kded org.kde.kded.setModuleAutoloading randrmonitor false"
		elog
		elog "Enable the kded module for the kscreen based screen management:"
		elog "# qdbus org.kde.kded /kded org.kde.kded.loadModule kscreen"
		elog
		elog "Now simply (un-)plugging displays should enable/disable them, while"
		elog "the last state is remembered."
		echo
	fi

	unset DISPLAY_MESSAGE

	kde4-base_pkg_postinst
}
