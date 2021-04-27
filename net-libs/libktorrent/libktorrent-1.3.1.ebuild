# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_SCM="git"
if [[ ${PV} != 9999* ]]; then
	KDE_HANDBOOK="optional"
	KDE_DOC_DIRS="doc"

	SRC_URI="http://deb.debian.org/debian/pool/main/libk/${PN}/${P/-/_}.orig.tar.bz2 -> ${MY_P}.tar.bz2"
	S="${WORKDIR}"/"${MY_P}"

	KEYWORDS="amd64 ~arm x86"
fi
VIRTUALX_REQUIRED="test"
inherit kde4-base

DESCRIPTION="BitTorrent library based on KDELibs4 Platform"
HOMEPAGE="https://apps.kde.org/ktorrent/ https://userbase.kde.org/KTorrent"

LICENSE="GPL-2"
SLOT="4"
IUSE="debug"

RDEPEND="
	app-crypt/qca:2-qt4
	dev-libs/gmp:0=
	dev-libs/libgcrypt:0=
"
DEPEND="${RDEPEND}
	dev-libs/boost
	sys-devel/gettext
"

src_prepare() {
	kde4-base_src_prepare
	# do not build non-installed example binary
	sed -i -e '/add_subdirectory(examples)/d' CMakeLists.txt || die
}
