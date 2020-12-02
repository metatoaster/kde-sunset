# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN="${PN}-1"
MY_P="${MY_PN}-${PV}"
EGIT_REPONAME="${MY_PN}"
inherit kde4-base

DESCRIPTION="PolKit agent module for KDE"
HOMEPAGE="https://www.kde.org"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${MY_PN/-agent/}_${PV}.orig.tar.xz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 ~arm x86"
IUSE="debug minimal"

COMMON_DEPEND="
	>=sys-auth/polkit-qt-0.103.0[qt4(-)]
"
DEPEND="${COMMON_DEPEND}
	sys-devel/gettext
"
RDEPEND="${COMMON_DEPEND}
	!sys-auth/polkit-kde
"
src_prepare() {
	kde4-base_src_prepare

	# Coinstallability with kde-plasma/polkit-kde-agent
	use minimal && rm -rf po
}
