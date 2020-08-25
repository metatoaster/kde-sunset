# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_MINIMAL="${PV}"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE hexeditor"
HOMEPAGE="https://www.kde.org/applications/utilities/okteta
https://utils.kde.org/projects/okteta"
SRC_URI="mirror://kde/Attic/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2"
SLOT=4/$(get_version_component_range 1-2)
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	app-crypt/qca:2-qt4
"
RDEPEND="${DEPEND}"
