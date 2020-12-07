# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit cmake python-any-r1

DESCRIPTION="Qt bindings for the Telepathy D-Bus protocol"
HOMEPAGE="https://telepathy.freedesktop.org/"
SRC_URI="https://telepathy.freedesktop.org/releases/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0-qt4"
KEYWORDS="amd64 ~arm x86"
IUSE="debug farstream"

# test deps are gone
RESTRICT+=" test"

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	farstream? (
		>=net-libs/telepathy-farstream-0.2.2
		>=net-libs/telepathy-glib-0.18.0
	)
"
RDEPEND="${DEPEND}
	!net-libs/telepathy-qt4
	!<net-libs/telepathy-qt-0.9.8:0
"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
"

DOCS=( AUTHORS ChangeLog HACKING NEWS README )

PATCHES=(
	"${FILESDIR}/${PN}-0.9.6.1-yes-release.patch"
	"${FILESDIR}/${PN}-0.9.6.1-qtpath.patch"
)

pkg_setup() {
	python-any-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DEBUG_OUTPUT=$(usex debug)
		-DENABLE_FARSTREAM=$(usex farstream)
		-DENABLE_TESTS=OFF
		-DENABLE_EXAMPLES=OFF
		-DDESIRED_QT_VERSION=4
	)
	cmake_src_configure
}
