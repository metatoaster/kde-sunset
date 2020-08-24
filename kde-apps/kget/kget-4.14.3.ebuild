# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base kde4-functions-extra

DESCRIPTION="Advanced download manager by KDE"
HOMEPAGE="https://www.kde.org/applications/internet/kget/"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug bittorrent gpg mms sqlite"

RDEPEND="
	app-crypt/qca:2-qt4
	$(add_kdeapps_dep libkonq)
	$(add_kdeplasma_dep libkworkspace '' 4.11)
	bittorrent? ( >=net-libs/libktorrent-1.0.3:4 )
	gpg? ( $(add_kdeapps_dep kdepimlibs) )
	mms? ( media-libs/libmms )
	sqlite? ( dev-db/sqlite:3 )
"
DEPEND="${RDEPEND}
	dev-libs/boost
"

src_configure() {
	local mycmakeargs=(
		-DWITH_NepomukCore=OFF
		-DWITH_NepomukWidgets=OFF
		-DWITH_KWebKitPart=OFF
		$(cmake-utils_use_with bittorrent KTorrent)
		$(cmake-utils_use_with gpg QGpgme)
		$(cmake-utils_use_with mms LibMms)
		$(cmake-utils_use_with sqlite)
	)
	kde4-base_src_configure
}
