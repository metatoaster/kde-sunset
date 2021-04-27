# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="automoc4"
MY_P="${MY_PN}-${PV}"
inherit cmake flag-o-matic

DESCRIPTION="KDE Meta Object Compiler"
HOMEPAGE="https://www.kde.org"
SRC_URI="mirror://kde/stable/${MY_PN}/${PV}/${MY_P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~x86-solaris"
IUSE=""

DEPEND="dev-qt/qtcore:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

PATCHES=( "${FILESDIR}/${PN}-0.9.88-objc++.patch" )

src_prepare() {
	cmake_src_prepare

	if [[ ${ELIBC} = uclibc ]]; then
		append-flags -pthread
	fi
}
