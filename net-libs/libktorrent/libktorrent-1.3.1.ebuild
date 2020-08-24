# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_SCM="git"
if [[ ${PV} != 9999* ]]; then
	inherit versionator
	# upstream likes to skip that _ in beta releases
	MY_PV="${PV/_/}"
	KTORRENT_VERSION=$(($(get_major_version)+3)).$(get_version_component_range 2-3 ${MY_PV})
	MY_P="${PN}-${MY_PV}"
	KDE_HANDBOOK="optional"
	KDE_DOC_DIRS="doc"

	SRC_URI="http://deb.debian.org/debian/pool/main/libk/${PN}/${P/-/_}.orig.tar.bz2 -> ${MY_P}.tar.bz2"
	S="${WORKDIR}"/"${MY_P}"

	KEYWORDS="amd64 ~arm x86"
fi
VIRTUALX_REQUIRED="test"
inherit kde4-base

DESCRIPTION="A BitTorrent library based on KDE Platform"
HOMEPAGE="https://kde.org/applications/internet/org.kde.ktorrent
https://userbase.kde.org/KTorrent"

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
