# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

COMMIT=76aba9ff19cf10f7e8fbf6753235bbb47cd2d295
VIRTUALX_REQUIRED="test"
inherit kde4-base

DESCRIPTION="Plasma screen management library"
HOMEPAGE="https://invent.kde.org/plasma/libkscreen"
SRC_URI="https://github.com/KDE/libkscreen/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

RDEPEND="
	>=dev-libs/qjson-0.8
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXrandr
"
DEPEND="
	${RDEPEND}
	test? ( dev-qt/qttest:4 )
"

S="${WORKDIR}/${PN}-${COMMIT}"
