# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

COMMIT=8e6845216dc1f7bae64311459042e528b8e78de1
KDEBASE="kdevelop"
inherit kde4-base

DESCRIPTION="A LL(1) parser generator used mainly by KDevelop language plugins"
SRC_URI="https://invent.kde.org/${KDEBASE}/${PN}/-/archive/${COMMIT}/${PN}-${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="LGPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	sys-devel/bison
	sys-devel/flex
"
RDEPEND="dev-util/kdevelop:4"
