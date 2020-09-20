# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
KDE_MINIMAL="${PV}"
KMNAME="kdepim"
inherit kde4-meta

DESCRIPTION="Note taking utility by KDE"
HOMEPAGE="https://www.kde.org/applications/utilities/kjots/"
SRC_URI="https://dev.gentoo.org/~asturm/distfiles/${KMNAME}-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT=4/$(get_version_component_range 1-2)
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	$(add_kdeapps_dep kdepim-common-libs)
	$(add_kdeapps_dep kdepimlibs)
	dev-libs/grantlee:0
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	akonadi_next/
	noteshared/
"
