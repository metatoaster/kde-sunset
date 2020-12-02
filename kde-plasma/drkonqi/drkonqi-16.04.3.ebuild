# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_MINIMAL="${PV}"
KMNAME="kde-runtime"
WEBKIT_REQUIRED="always"
inherit kde4-meta

DESCRIPTION="KDE crash handler, gives the user feedback if a program crashed"
HOMEPAGE="https://kde.org/"
SRC_URI="mirror://kde/Attic/applications/${PV}/src/${KMNAME}-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT=4/$(get_version_component_range 1-2)
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	>=kde-apps/kdepimlibs-4.14.3:4
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	kde4-meta_pkg_postinst
	if ! has_version "sys-devel/gdb"; then
		elog "For more usability consider installing following packages:"
		elog "    sys-devel/gdb - Easier debugging support"
	fi
}
