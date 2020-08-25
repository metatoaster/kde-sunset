# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="KWin theme engine that uses Emerald themes"
HOMEPAGE="https://invent.kde.org/plasma/smaragd https://store.kde.org/p/1167274"
SRC_URI="https://invent.kde.org/plasma/smaragd/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	kde-plasma/libkworkspace:4
	x11-libs/cairo
"
RDEPEND="${DEPEND}
	kde-plasma/kwin:4
"

S="${WORKDIR}/${PN}-v${PV}"
